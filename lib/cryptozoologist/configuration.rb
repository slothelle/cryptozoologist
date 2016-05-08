module Cryptozoologist
  class Configuration
    attr_reader :exclude

    def initialize
      @exclude = []
    end

    def exclude=(exclusions)
      raise Errors::Configuration, "Exclusions must be an array" unless exclusions.is_a?(Array)

      @exclude = exclusions.select { |e| valid_exclusions.include?(e) }
    end

    private
    def valid_exclusions
      Cryptozoologist.dictionaries.keys
    end
  end
end