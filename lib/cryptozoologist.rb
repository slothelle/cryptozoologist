require "cryptozoologist/version"
require "cryptozoologist/errors"
require "cryptozoologist/configuration"

dictionaries = "#{File.dirname(__FILE__)}/cryptozoologist/dictionaries/**/*.rb"
Dir[dictionaries].each { |file| require file }

require "cryptozoologist/dictionary"
require "cryptozoologist/dictionaries"

module Cryptozoologist
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  protected
  def self.subdictionaries
    Dictionaries.library
  end
end
