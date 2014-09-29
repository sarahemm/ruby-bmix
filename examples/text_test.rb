#!/opt/local/bin/ruby1.9

require '../lib/bmix.rb'
require 'cairo'

surface = Cairo::ImageSurface.new(Cairo::Format::ARGB32, 96, 32)
ctx = Cairo::Context.new(surface)
ctx.set_source_color(:white)
ctx.select_font_face 'SansSerif', Cairo::FONT_SLANT_NORMAL, Cairo::FONT_WEIGHT_NORMAL
ctx.set_font_size 12
ctx.move_to 15, 10
ctx.show_text "Test Bmix"
ctx.move_to 30, 25
ctx.show_text "Text!"

bmix = Bmix::Sender.new(ARGV[0], ARGV[1])
bmix.send_frame surface
