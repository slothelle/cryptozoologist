$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'pry'
require 'pry-nav'
require 'cryptozoologist'

RSpec.configure do |config|

  # reset configuration globally
  config.before(:all) do
    Cryptozoologist.reset
  end
end