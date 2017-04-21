require 'spec_helper'

describe Cryptozoologist do
  context '#random' do
    it 'returns a string' do
      expect(Cryptozoologist.random).to be_instance_of(String)
    end

    it 'returns a string with the delimiter' do
      expect(Cryptozoologist.random.match('-')).to be_instance_of(MatchData)
    end

    describe('with quantity') do
      before do
        Cryptozoologist.configure do |config|
          config.include = [:quantity]
          config.delimiter = "_"
        end
      end

      it 'returns a string with quantity' do
        random = Cryptozoologist.random.split("_")
        expect(Cryptozoologist::Dictionaries::Quantity.list.include?(random.first)).to be true
      end

      it 'only has one word from the quantity list' do
        Cryptozoologist.random
        random = Cryptozoologist.random.split("_")
        matches = Cryptozoologist::Dictionaries::Quantity.list.select do |word|
          random.include?(word)
        end
        expect(matches.length).to eq(1)
      end
    end
  end
end
