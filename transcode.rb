require 'base64'
require './string_ext'

module TransCode
  using StringExt

  class << self
    def encode horizontal, vertical
      [horizontal, vertical].reject(&:integer?).each do |s|
        STDERR.puts "Not a number: #{s}"
        exit 1
      end
      packed = [0, horizontal.to_i, 0, vertical.to_i, 0, 0, 0, 1].pack 'n4C4'
      Base64.encode64 packed
    end

    def decode str
      _, horizontal, _, vertical = TransCode.raw str
      [horizontal, vertical]
    end
    
    def raw str
      decoded = Base64.decode64 str
      decoded.unpack 'n4C8'
    end
  end
end
