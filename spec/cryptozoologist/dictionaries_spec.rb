require_relative '../spec_helper'

describe Cryptozoologist::Dictionaries do
  context '#words' do
    it 'has a word list' do
      expect(Cryptozoologist::Dictionaries.words.length).to be > 1
    end

    it 'contains Common animals' do
      common = Cryptozoologist::Dictionaries::Common::LIST
      expect(Cryptozoologist::Dictionaries.words.include?(common.sample)).to be true
    end

    it 'contains Mythical creatures' do
      mythical = Cryptozoologist::Dictionaries::Mythical::LIST
      expect(Cryptozoologist::Dictionaries.words.include?(mythical.sample)).to be true
    end
  end

  it '#common' do
    expect(Cryptozoologist::Dictionaries.common).to eq(Cryptozoologist::Dictionaries::Common::LIST)
  end

  it '#mythical' do
    expect(Cryptozoologist::Dictionaries.mythical).to eq(Cryptozoologist::Dictionaries::Mythical::LIST)
  end
end
