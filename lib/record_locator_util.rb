module Util
  ENCODER = Hash.new do |h,k|
    h[k] = Hash[ k.chars.map.enum_for(:each_with_index).to_a.map(&:reverse) ]
  end
  DECODER = Hash.new do |h,k|
    h[k] = Hash[ k.chars.map.enum_for(:each_with_index).to_a ]
  end

  BASE32 = "23456789ABCDEFGHJKLMNPqRSTUVWXYZ"

  class Base
    def self.encode(value)
      ring = Util::ENCODER[Util::BASE32]
      base = Util::BASE32.length
      result = []
      until value == 0
        result << ring[ value % base ]
        value /= base
      end
      result.reverse.join
    end
    def self.decode(string)
      string = string.to_s
      ring = Util::DECODER[Util::BASE32]
      base = Util::BASE32.length
      string.reverse.chars.with_index.inject(0) do |sum,(char,i)|
        sum + ring[char] * base**i
      end
    end
  end
end