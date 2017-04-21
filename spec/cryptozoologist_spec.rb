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

  context '#generate' do
    it 'returns a string' do
      expect(Cryptozoologist.generate).to be_instance_of(String)
    end

    it 'returns a string with the delimiter' do
      expect(Cryptozoologist.generate.match('-')).to be_instance_of(MatchData)
    end

    describe('with quantity') do
      before do
        Cryptozoologist.configure do |config|
          config.include = [:quantity]
          config.delimiter = "_"
        end
      end

      it 'returns a string with quantity' do
        generated = Cryptozoologist.generate.split("_")
        expect(Cryptozoologist::Dictionaries::Quantity.list.include?(generated.first)).to be true
      end

      it 'only has one word from the quantity list' do
        Cryptozoologist.generate
        generated = Cryptozoologist.generate.split("_")
        matches = Cryptozoologist::Dictionaries::Quantity.list.select do |word|
          generated.include?(word)
        end
        expect(matches.length).to eq(1)
      end
    end
  end
end
