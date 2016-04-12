require "cryptozoologist/version"

directory = "#{File.dirname(__FILE__)}/cryptozoologist/dictionaries/*/*.rb"
Dir[directory].each { |file| require file }

require "cryptozoologist/dictionary"
require "cryptozoologist/dictionaries"

module Cryptozoologist
  # Your code goes here...
end
