require 'socket'
require 'cairo'

module Bmix
  class Sender
    def initialize(ip, port)
      @udp = UDPSocket.new
      @udp.connect ip, port
    end
    
    def send_raw_frame(width, height, data)
      data_str = data.pack("C*")
      msg = "\x23\x54\x26\x66"
      msg += "\x00#{height.chr}\x00#{width.chr}" # TODO: support >255 height/width
      msg += "\x00\x01\x00\xFF";
      msg += data_str
      @udp.send msg, 0
    end
    
    def send_frame(cairo_surface, threshold = 0x77)
      data = Array.new
      bpp = cairo_surface.data.length / (cairo_surface.width * cairo_surface.height)
      cairo_surface.data.split(//).each_slice(bpp) do |pixel|
        pixel_val = pixel[0].ord
        data.push(pixel_val < threshold ? 0x00 : 0xFF)
      end
      send_raw_frame cairo_surface.width, cairo_surface.height, data
    end
  end
end