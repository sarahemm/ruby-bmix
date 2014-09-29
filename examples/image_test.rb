#!/opt/local/bin/ruby1.9

require '../lib/bmix.rb'
require 'cairo'

test_image = Cairo::ImageSurface.from_png("./image_test.png")

bmix = Bmix::Sender.new(ARGV[0], ARGV[1])
bmix.send_frame test_image
