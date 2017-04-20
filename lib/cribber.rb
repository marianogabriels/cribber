require "cribber/version"
require 'securerandom'

module Cribber
  class <<  self
    def strxor(a,b)
      if a.size > b.size
        (b.bytes.zip(a.bytes)).map{|e| (e[0] ^ e[1]).chr}.join
      else
        (a.bytes.zip(b.bytes)).map{|e| (e[0] ^ e[1]).chr}.join
      end 
    end

    def random_key(size)
      SecureRandom.random_bytes(size)
    end

    def crib(xored_message,guess)
      xored_message.chars.each_cons(guess.length).map { |char| strxor(xored_message, char.join) }
    end
  end
end
