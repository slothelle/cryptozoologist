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
    # Note: optional arguments desired_library is an String containing the single replacement word of your choice
    # desired_state is a String of the specific state name of your choice
    #{}`desired_replace_index` is an integer that allows you to specify whether the first
    #or second word will be replaced, or in the case of a one-word state - which letter is replaced
    def state(desired_state, desired_library, desired_replace_index)
      libraries = desired_library || [:animals, :clothing, :colors]
      state_name = desired_state || Dictionary.states.sample
      has_two_words = state_name.index(" ")

      if has_two_words
        handle_two_word(state_name, libraries, desired_replace_index)
      else
        handle_one_word(state_name, libraries, desired_replace_index)
      end
    end

    def city
      exclude = Cryptozoologist.configuration.exclude
      cities_words = Cryptozoologist::Cities::Words.list
      cities_terminologies = Cryptozoologist::Cities::Terminologies.list
      words_formatted = exclude.include?(:words) ? [] : cities_words.map { |word| " #{word.capitalize}" }
      terminologies = exclude.include?(:terminologies) ? [] : cities_terminologies
      city_labels =  words_formatted + terminologies

      "#{one_word_animals.sample.capitalize}#{city_labels.sample}"
    end

    private

    #completely replaces one random word from the state with an alliterative word from libraries
    def handle_two_word(state_name, libraries, desired_replace_index)
      base_state_words = state_name.split(" ")
      replace_index = desired_replace_index || rand(0..1)
      base_state_words[replace_index] = get_alliteration(libraries, base_state_words[replace_index][0]).capitalize
      return base_state_words.join(" ")
    end

    #selects a random key_letter from state_name, and finds an alliterative word from libraries for replacement
    def handle_one_word(state_name, libraries, desired_replace_index)
      key_letter_index = desired_replace_index || rand(0...state_name.length-1)
      insert_word = get_alliteration(libraries, state_name[key_letter_index]).downcase

      #if the randomly selected word from libraries has more letters than the substring from key_letter_index to state_name.length
      #completely replace that substring
      if insert_word.length > (state_name.length - key_letter_index) && key_letter_index > 0
        final_word = state_name.slice(0...key_letter_index) + insert_word
      #otherwise, replace only the key_letter with the entire random word from libraries
      else
        state_name[key_letter_index] = insert_word
        final_word = state_name
      end

      final_word.capitalize
    end

    #finds a word from libraries that begins with key_letter
    def get_alliteration(libraries, key_letter)
      return libraries if libraries.is_a? String #this is the case for testing
      replacement_options = Dictionary.send(libraries.sample).select { |word| word[0] == key_letter || word[0] == key_letter.downcase }

      #default to :animals library if the randomly-selected library has no words that begin with key_letter
      if replacement_options.empty?
        replacement_options = Dictionary.send(:animals).select { |word| word[0] == key_letter || word[0] == key_letter.downcase }
      end

      replacement_options.sample
    end

    def one_word_animals
      Dictionary.animals.select {|animal| animal.split(' ').count == 1}
    end
  end
end
