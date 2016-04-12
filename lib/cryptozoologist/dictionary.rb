module Cryptozoologist
  class Dictionary
    def initialize
      @words = []
    end

    def words
      @words if @words.any?
      @words = Dictionaries.words
      @words
    end
  end
end
