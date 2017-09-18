module Cryptozoologist
  class Configuration
    attr_reader :exclude, :delimiter, :order, :include

    def initialize
      @exclude = []
      @delimiter = "-"
      @order = [:colors, :animals, :clothing]
      @include = []
    end

    def order=(list)
      raise Errors::Configuration, "Order must be an array" unless list.is_a?(Array)
      raise Errors::Configuration, "Order must contain 3 items" unless list.length == 3
      invalid_keys = list.select { |e| !valid_order.include?(e) }
      raise Errors::Configuration, "Invalid order setting provided: #{invalid_keys}" unless invalid_keys.empty?
      @order = list
    end

    def delimiter=(string)
      raise Errors::Configuration, "delimiter must be a a string" unless string.is_a?(String)

      @delimiter = string
    end

    def include=(inclusions)
      raise Errors::Configuration, "Inclusions must be an array" unless inclusions.is_a?(Array)

      @include = inclusions.select { |e| valid_inclusions.include?(e) }
      inclusions += @order
      @order = inclusions
    end

    def exclude=(exclusions)
      raise Errors::Configuration, "Exclusions must be an array" unless exclusions.is_a?(Array)

      @exclude = exclusions.select { |e| valid_exclusions.include?(e) }
    end

    def include_quantity?
      @include.include?(:quantity)
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

    def valid_inclusions
      [:quantity]
    end
  end
end