require 'socket'
require 'cairo'

module Bmix
  class Sender
    def initialize(ip, port)
      @udp = UDPSocket.new
      @udp.connect ip, port
    end
    
    def send_raw_frame(width, height, data)
      msg=""
      # [ Magic String (4),  Width(2)  Height(2), More Magic(4) ]
      [0x23,0x54,0x26,0x66, ( height >> 8) , height & 0xFF, ( width >> 8 ) , width & 0xFF, 0x00,0x01,0x00,0xFF].each{|c| msg += c.chr}
      data.each{|c| msg+=c.chr}
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
