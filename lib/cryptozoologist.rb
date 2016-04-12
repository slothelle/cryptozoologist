require "cryptozoologist/version"

Dir["cryptozoologist/dictionaries/*"].each { |file| require file }

require "cryptozoologist/dictionary"
require "cryptozoologist/dictionaries"

module Cryptozoologist
  # Your code goes here...
end
