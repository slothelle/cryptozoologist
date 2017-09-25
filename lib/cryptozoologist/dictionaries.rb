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
        },
        cities: {
          words: Cities::Words,
          terminologies: Cities::Terminologies
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

    def cities
      create_list(:cities)
    end

    private
    def create_list(key)
      list = []
      filter_library(key).each { |word_bank| list << word_bank.list }
      list.flatten
    end

    def filter_library(filter_key)
      dictionaries = library[filter_key].reject do |key, _value|
        Cryptozoologist.configuration.exclude.include?(key)
      end
      dictionaries.values
    end
  end
end
