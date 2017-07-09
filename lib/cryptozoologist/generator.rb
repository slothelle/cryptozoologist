module Cryptozoologist
  module Generator
    extend self

    # Generates sentence_count sentences, ranging in length from 10-16 words,
    # using the dictionaries from your config.
    # 
    def lorem(sentence_count)
      sentences = []
      order = Cryptozoologist.configuration.order
      sentence_count.times do
        words = []
        length = rand(9..16)
        per_dictionary = length / order.length

        order.each do |library|
          words += Dictionary.send(library).sample(per_dictionary)
          words << Dictionary.filler.sample
        end

        words.shuffle!
        sentence = words.join(" ")
        sentence.capitalize!
        sentence << Dictionary.punctuation.sample
        sentences << sentence
      end

      sentences.join(" ")
    end

    # Generates a string using the dictionaries and delimiter from your config.
    # 
    def random
      string = ""
      order = Cryptozoologist.configuration.order
      order.each do |library|
        word = Dictionary.send(library).sample
        compound_word = word.split(' ').join(Cryptozoologist.configuration.delimiter)
        string += "#{compound_word}"

        unless library == Cryptozoologist.configuration.order.last
          string += "#{Cryptozoologist.configuration.delimiter}" 
        end
      end

      string
    end

    # Generates a string for a street address with a number and street. Only
    # uses animal dictionaries and does not respect config exclusions.
    #
    def street_address
      number = rand(1..9000)
      street = Dictionary.animals.sample
      street = street.split(" ").map! {|word| word.capitalize! }.join(" ")
      "#{number} #{street} #{Dictionary.addresses.sample}"
    end

    def city
      cities_words_formatted = Dictionary.cities_words.map { |word| " #{word.capitalize}" }
      city_labels =  cities_words_formatted + Dictionary.cities_terminologies

      "#{one_word_animals.sample.capitalize}#{city_labels.sample}"
    end

    private

    def one_word_animals
      Dictionary.animals.select {|animal| animal.split(' ').count == 1}
    end
  end
end