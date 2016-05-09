module Cryptozoologist
  class Dictionary
    def initialize
      @animals = []
      @colors = []
    end

    def animals
      @animals if @animals.any?
      @animals = Dictionaries.animals
      @animals
    end

    def colors
      @colors if @colors.any?
      @colors = Dictionaries.colors
      @colors
    end
  end
end
