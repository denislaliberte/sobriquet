module Sobriquet
  # Command hold value of the command
  class Command
    attr_reader :value, :alias, :description, :type
    def initialize(data)
      @value = data[0]
      @alias = data[1]
      @description = data[2]
      @type = data[3]
    end
  end
end
