require "cryptozoologist/version"
require "cryptozoologist/errors"
require "cryptozoologist/configuration"

dictionaries = "#{File.dirname(__FILE__)}/cryptozoologist/dictionaries/**/*.rb"
Dir[dictionaries].each { |file| require file }

require "cryptozoologist/dictionary"
require "cryptozoologist/dictionaries"
require "cryptozoologist/generator"

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
    self.reset
    yield(configuration)
  end

  def self.lorem(sentence_count=1)
    Generator.lorem(sentence_count)
  end

  def self.random
    Generator.random
  end

  def self.generate
    Generator.random
  end

  def self.street_address
    Generator.street_address
  end

  def self.state(desired_state=nil, desired_library=nil, desired_replace_index=nil)
    Generator.state(desired_state, desired_library, desired_replace_index)
  end

  def self.city
    Generator.city
  end

  def self.name
    Generator.name
  end

  protected
  def self.subdictionaries
    Dictionaries.library
  end
end
