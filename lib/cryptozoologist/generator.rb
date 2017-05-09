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

    # Generates a string for a U.S. state name which is partially replaced by
    # alliterative words from other dictionaries (e.g. "Oregon" can become "Oregoose" or "Orabbit")
    # Does not respect config exclusions
    def state
      libraries = [:animals, :clothing, :colors]
      base_state_words = Dictionary.states.sample.split(" ")
      has_two_words = base_state_words.length > 1
      if has_two_words
        replace_index = rand(0..1)
        puts "base word: #{base_state_words[replace_index]}"
        base_state_words[replace_index] = get_alliteration(libraries, base_state_words[replace_index][0]).capitalize
        return base_state_words.join(" ")
      else
        base_word = base_state_words[0]
        puts "base word: #{base_word}"
        key_letter_index = rand(0...base_word.length-1)
        insert_word = get_alliteration(libraries, base_word[key_letter_index]).downcase
        if insert_word.length > base_word.length - key_letter_index && key_letter_index > 0
          final_word = base_word.slice(0...key_letter_index) + insert_word
        else
          base_word[key_letter_index] = insert_word
          final_word = base_word
        end
      end

      final_word.capitalize! || final_word
    end

    private

    def get_alliteration(libraries, key_letter)
      puts "key letter: #{key_letter}"
      replacement_options = Dictionary.send(libraries.sample).select { |word| word[0] == key_letter || word[0] == key_letter.downcase }
      if replacement_options.empty?
        replacement_options = Dictionary.send(:animals).select { |word| word[0] == key_letter || word[0] == key_letter.downcase }
      end

      replacement_options.sample
    end
  end
end
