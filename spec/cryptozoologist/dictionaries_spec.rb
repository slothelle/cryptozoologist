require_relative '../spec_helper'

describe Cryptozoologist::Dictionaries do
  context '#words' do
    it 'has a word list' do
      expect(Cryptozoologist::Dictionaries.animals.length).to be > 1
    end

    it 'contains Common animals' do
      common = Cryptozoologist::Dictionaries::Animals::Common::LIST
      expect(Cryptozoologist::Dictionaries.animals.include?(common.sample)).to be true
    end

    it 'contains Mythical creatures' do
      mythical = Cryptozoologist::Dictionaries::Animals::Mythical::LIST
      expect(Cryptozoologist::Dictionaries.animals.include?(mythical.sample)).to be true
    end
  end
end
