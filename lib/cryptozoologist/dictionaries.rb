module Cryptozoologist
  module Dictionaries
    extend self

    def animals
      list = []
      filtered.each { |word_bank| list << word_bank.list }
      list.flatten
    end

    def library
      {
        common: Animals::Common,
        mythical: Animals::Mythical
      }
    end

    private def filtered
      dictionaries = library.reject do |key, value|
        Cryptozoologist.configuration.exclude.include?(key)
      end
      dictionaries.values
    end
  end
end
