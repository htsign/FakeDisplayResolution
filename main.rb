#!/usr/bin/env ruby -w

require 'rexml/document'
require './transcode'

COMMAND = 'ioreg -lw0 | grep -e %s | sed -e \'s/.*= //g\''.freeze
PLIST_ROOT = '/System/Library/Displays/Contents/Resources/Overrides'.freeze

def display_texts file
  File.open file do |f|
    doc = REXML::Document.new f.read
    doc.elements.each('//key[text()="scale-resolutions"]/following-sibling::array/data/text()').map(&:to_s)
  end
end

disp_vend_id = `#{COMMAND % 'DisplayVendorID'}`.to_i
disp_prod_id = `#{COMMAND % 'DisplayProductID'}`.to_i

path = "#{PLIST_ROOT}/DisplayVendorID-#{disp_vend_id.to_s 16}/DisplayProductID-#{disp_prod_id.to_s 16}"

unless File.exist? path
  STDERR.puts "File Not Found: #{path}"
  exit 1
end

displays = display_texts path
case ARGV[0]
when 'path'
  puts path
when 'list'
  displays.each do |disp|
    puts "%4d x %4d" % (TransCode.decode disp)
  end
when 'rawlist'
  displays.each do |disp|
    p (TransCode.raw disp)
  end
when 'encode'
  h, v = ARGV[1..]
  puts (TransCode.encode h, v)
when 'open'
  exec "open -a Finder -R #{path}"
end
