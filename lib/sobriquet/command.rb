module Sobriquet
  # Command hold value and compile to executable string
  class Command
    attr_reader :value, :alias, :description
    def initialize(data)
      @value = data[0]
      @alias = data[1]
      @description = data[2]
    end

    def command
      "# #{@description}\nalias #{@alias}=\"#{@value}\"\n"
    end
  end
end
