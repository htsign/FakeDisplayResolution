require 'base64'
require './string_ext'

module TransCode
  using StringExt

  class << self
    def encode horizontal, vertical
      [horizontal, vertical].each do |s|
        unless s.integer?
          STDERR.puts "Not a number: #{s}"
          exit 1
        end
      end
      packed = [0, horizontal.to_i, 0, vertical.to_i, 0, 0, 0, 1].pack 'nnnnCCCC'
      Base64.encode64 packed
    end

    def decode str
      _, horizontal, _, vertical = TransCode.raw str
      [horizontal, vertical]
    end
    
    def raw str
      decoded = Base64.decode64 str
      decoded.unpack 'nnnnCCCCCCCC'
    end
  end
end
