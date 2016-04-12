module Cryptozoologist
  module Dictionaries
    extend self

    def words
      list = []
      word_lists.each { |word_bank| list << word_bank }
      list.flatten
    end

    def common
      Common::LIST
    end

    def mythical
      Mytical::LIST
    end

    private def word_lists
      [ Common::LIST, Mytical::LIST ]
    end
  end
end
