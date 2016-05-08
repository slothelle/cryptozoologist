require_relative '../spec_helper'

describe Cryptozoologist::Dictionary do
  before do
    @dictionary = Cryptozoologist::Dictionary.new
  end

  it 'has an animal list' do
    expect(@dictionary.animals.length).to be > 1
  end

  it 'contains Common animals' do
    common = Cryptozoologist::Dictionaries::Animals::Common.list
    expect(@dictionary.animals.include?(common.sample)).to be true
  end

  it 'contains Mythical creatures' do
    mythical = Cryptozoologist::Dictionaries::Animals::Mythical.list
    expect(@dictionary.animals.include?(mythical.sample)).to be true
  end
end
