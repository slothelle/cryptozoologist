require_relative '../spec_helper'

describe Cryptozoologist::Dictionaries do
  subdictionaries = {
    "animals": {
      subtypes: [:common, :mythical],
      common: Cryptozoologist::Dictionaries::Animals::Common,
      mythical: Cryptozoologist::Dictionaries::Animals::Mythical
    },
    "colors": {
      subtypes: [:paint, :web],
      paint: Cryptozoologist::Dictionaries::Colors::Paint,
      web: Cryptozoologist::Dictionaries::Colors::WebSafe
    }
  }

  dictionaries = { 
    "clothing": Cryptozoologist::Dictionaries::Clothing,
    "quantity": Cryptozoologist::Dictionaries::Quantity
  }

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

  subdictionaries.each do |type, subdictionary|
    context "##{type}" do
      it 'has a word list' do
        expect(Cryptozoologist::Dictionaries.send(type.to_sym).length).to be > 1
      end

      subdictionary[:subtypes].each do |subtype|
        it "contains #{subtype} #{type}" do
          sublist = subdictionary[subtype].list
          expect(Cryptozoologist::Dictionaries.send(type.to_sym).include?(sublist.sample)).to be true
        end

        it 'filters out exclusions' do
          Cryptozoologist.reset

          Cryptozoologist.configure do |config|
            config.exclude = [subtype]
          end

          sublist = subdictionary[subtype].list
          expect(Cryptozoologist::Dictionaries.send(type.to_sym).include?(sublist.sample)).to be false
        end
      end

      it 'does not contain other types of words' do
        Cryptozoologist.reset

        sublists = []
        subdictionary[:subtypes].each do |subtype|
          sublists += subdictionary[subtype].list
        end

        expect(sublists.sort).to eq(Cryptozoologist::Dictionaries.send(type.to_sym).sort)
      end
    end
  end

  dictionaries.each do |type, dictionary|
    context "##{type}" do
      it "has a #{type} list" do
        expect(Cryptozoologist::Dictionaries.send(type.to_sym).length).to be > 1
      end

      it "contains #{type} words" do
        expect(Cryptozoologist::Dictionaries.send(type.to_sym).include?(dictionary.list.sample)).to be true
      end

      it "does not contain other types of words" do
        expect(Cryptozoologist::Dictionaries.colors.sort).not_to eq(dictionary.list.sort)
      end

      it "is not a valid exclusion" do
        Cryptozoologist.configure do |config|
          config.exclude = [type.to_sym]
        end

        expect(Cryptozoologist::Dictionaries.send(type.to_sym).include?(dictionary.list.sample)).to be true
      end
    end
  end
end
