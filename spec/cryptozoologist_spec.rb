require 'spec_helper'

describe Cryptozoologist do
  it 'has a version number' do
    expect(Cryptozoologist::VERSION).not_to be nil
  end

  it 'resets configuration' do
    Cryptozoologist.configure do |config|
      config.exclude = [:common]
    end
    expect(Cryptozoologist.configuration.exclude).to eq([:common])
    
    Cryptozoologist.reset
    expect(Cryptozoologist.configuration.exclude).to eq([])
  end
end
