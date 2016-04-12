module Cryptozoologist
  module Dictionaries
    extend self

    def animals
      list = []
      animal_lists.each { |word_bank| list << word_bank }
      list.flatten
    end

    private def animal_lists
      [ Animals::Common::LIST, Animals::Mythical::LIST ]
    end
  end
end
