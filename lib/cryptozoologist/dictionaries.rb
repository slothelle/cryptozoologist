module Cryptozoologist
  module Dictionaries
    extend self

    def animals
      list = []
      filtered(:animals).each { |word_bank| list << word_bank.list }
      list.flatten
    end

    def colors
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

    private def filtered(key)
      dictionaries = library[key].reject do |key, value|
        Cryptozoologist.configuration.exclude.include?(key)
      end
      dictionaries.values
    end
  end
end
