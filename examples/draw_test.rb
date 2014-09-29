#!/opt/local/bin/ruby1.9

require '../lib/bmix.rb'
require 'cairo'

surface = Cairo::ImageSurface.new(Cairo::Format::ARGB32, 96, 32)
ctx = Cairo::Context.new(surface)
ctx.set_source_color(:white)
ctx.rectangle(5, 5, 10, 10)
ctx.rectangle(50, 25, 5, 5)
ctx.stroke
ctx.show_page

bmix = Bmix::Sender.new(ARGV[0], ARGV[1])
bmix.send_frame surface
