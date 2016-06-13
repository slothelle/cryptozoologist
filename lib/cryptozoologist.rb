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

  def self.generate
    string = ""
    order = @configuration.order

    order.unshift(:quantity) if @configuration.include_quantity?

    order.each do |library|
      word = Dictionary.send(library).sample
      compound_word = word.split(' ').join(@configuration.delimeter)
      string += "#{compound_word}"

      unless library == @configuration.order.last
        string += "#{@configuration.delimeter}" 
      end
    end

    string
  end

  protected 
  def self.subdictionaries
    Dictionaries.library
  end
end
