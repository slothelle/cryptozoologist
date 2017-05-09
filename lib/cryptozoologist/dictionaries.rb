module Cryptozoologist
  module Dictionaries
    extend self

    def animals
      create_list(:animals)
    end

    def clothing
      Clothing.list
    end

    def colors
      create_list(:colors)
    end

    def quantity
      Quantity.list
    end

    def library
      {
        animals: {
          common: Animals::Common,
          mythical: Animals::Mythical
        },
        colors: {
          paint: Colors::Paint,
          web: Colors::WebSafe
        }
      }
    end

    def filler
      Filler.list
    end

    def punctuation
      Punctuation.list
    end

    def addresses
      Addresses.list
    end

    def states
      States.list
    end

    private
    def create_list(key)
      list = []
      filter_library(key).each { |word_bank| list << word_bank.list }
      list.flatten
    end

    def filter_library(key)
      dictionaries = library[key].reject do |key, value|
        Cryptozoologist.configuration.exclude.include?(key)
      end
      dictionaries.values
    end
  end
end
