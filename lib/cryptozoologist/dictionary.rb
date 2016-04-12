module Cryptozoologist
  class Dictionary
    def initialize
      @animals = []
    end

    def animals
      @animals if @animals.any?
      @animals = Dictionaries.animals
      @animals
    end
  end
end
