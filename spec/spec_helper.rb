require 'rubygems'
require 'bundler'
Bundler.require(:default, :development, :test)

require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class HashCache < Hash
  def exist?(key)
    self.has_key?(key)
  end

  def fetch(key, options = {}, &blk)
    if self.has_key?(key)
      return self[key]
    end

    self[key] = yield
  end

  def read(key)
    self[key]
  end

  def write(key, value)
    self[key] = value
  end
end
