module Sobriquet
  # Command hold value of the command
  class Command
    attr_reader :value, :alias, :description
    def initialize(data)
      @value = data[0]
      @alias = data[1]
      @description = data[2]
    end
  end
end
