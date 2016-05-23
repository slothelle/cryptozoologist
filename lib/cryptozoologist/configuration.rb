module Cryptozoologist
  class Configuration
    attr_reader :exclude, :delimeter, :order

    def initialize
      @exclude = []
      @delimeter = "-"
      @order = [:colors, :animals, :clothing]
    end

    def order=(list)
      raise Errors::Configuration, "Order must be an array" unless list.is_a?(Array)
      raise Errors::Configuration, "Order must contain 3 items" unless list.length == 3
      raise Errors::Configuration, "Invalid order setting provided" if list.any? { |e| !valid_order.include?(e) }

      @order = list
    end

    def delimeter=(string)
      raise Errors::Configuration, "Delimeter must be a a string" unless string.is_a?(String)

      @delimeter = string
    end

    def exclude=(exclusions)
      raise Errors::Configuration, "Exclusions must be an array" unless exclusions.is_a?(Array)

      @exclude = exclusions.select { |e| valid_exclusions.include?(e) }
    end

    private
    def valid_order
      [:animals, :colors, :clothing]
    end

    def valid_exclusions
      keys = []
      Cryptozoologist.subdictionaries.each { |key, value| keys += value.keys }
      keys
    end
  end
end