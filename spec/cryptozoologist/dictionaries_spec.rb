require_relative '../spec_helper'

describe Cryptozoologist::Dictionaries do
  context '#libraries' do
    it 'contains animals' do
      keys = Cryptozoologist::Dictionaries.library[:animals].keys
      expect(keys.length).to eq(2)
    end

    it 'contains colors' do
      keys = Cryptozoologist::Dictionaries.library[:colors].keys
      expect(keys.length).to eq(2)
    end
  end

  context '#animals' do
    it 'has a word list' do
      expect(Cryptozoologist::Dictionaries.animals.length).to be > 1
    end

    it 'contains Common animals' do
      common = Cryptozoologist::Dictionaries::Animals::Common.list
      expect(Cryptozoologist::Dictionaries.animals.include?(common.sample)).to be true
    end

    it 'contains Mythical creatures' do
      mythical = Cryptozoologist::Dictionaries::Animals::Mythical.list
      expect(Cryptozoologist::Dictionaries.animals.include?(mythical.sample)).to be true
    end

    it 'does not contain other types of words' do
      list = Cryptozoologist::Dictionaries::Animals::Common.list
      list += Cryptozoologist::Dictionaries::Animals::Mythical.list
      expect(list.sort).to eq(Cryptozoologist::Dictionaries.animals.sort)
    end

    it 'filters out exclusions' do
      Cryptozoologist.configure do |config|
        config.exclude = [:mythical]
      end
      mythical = Cryptozoologist::Dictionaries::Animals::Mythical.list
      expect(Cryptozoologist::Dictionaries.animals.include?(mythical.sample)).to be false
    end
  end

  context '#colors' do
    it 'has a color list' do
      expect(Cryptozoologist::Dictionaries.colors.length).to be > 1
    end

    it 'contains paint colors' do
      paint = Cryptozoologist::Dictionaries::Colors::Paint.list
      expect(Cryptozoologist::Dictionaries.colors.include?(paint.sample)).to be true
    end

    it 'contains web colors' do
      web = Cryptozoologist::Dictionaries::Colors::WebSafe.list
      expect(Cryptozoologist::Dictionaries.colors.include?(web.sample)).to be true
    end

    it 'does not contain other types of words' do
      list = Cryptozoologist::Dictionaries::Colors::Paint.list
      list += Cryptozoologist::Dictionaries::Colors::WebSafe.list
      expect(list.sort).to eq(Cryptozoologist::Dictionaries.colors.sort)
    end

    it 'filters out exclusions' do
      Cryptozoologist.configure do |config|
        config.exclude = [:paint]
      end
      paint = Cryptozoologist::Dictionaries::Colors::Paint.list
      expect(Cryptozoologist::Dictionaries.colors.include?(paint.sample)).to be false
    end
  end

  context '#clothing' do
    it 'has a clothing list' do
      expect(Cryptozoologist::Dictionaries.clothing.length).to be > 1
    end

    it 'contains paint colors' do
      clothing = Cryptozoologist::Dictionaries::Clothing.list
      expect(Cryptozoologist::Dictionaries.clothing.include?(clothing.sample)).to be true
    end

    it 'does not contain other types of words' do
      clothing = Cryptozoologist::Dictionaries::Clothing.list
      expect(clothing.sort).to eq(Cryptozoologist::Dictionaries.clothing.sort)
    end

    it 'is not a valid exclusion' do
      Cryptozoologist.configure do |config|
        config.exclude = [:clothing]
      end

      clothing = Cryptozoologist::Dictionaries::Clothing.list
      expect(Cryptozoologist::Dictionaries.clothing.include?(clothing.sample)).to be true
    end
  end
end
