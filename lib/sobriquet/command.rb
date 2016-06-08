module Sobriquet
  # Command hold value and compile to executable string
  class Command
    def initialize(data)
      @command = data[0]
      @alias = data[1]
      @description = data[2]
    end

    def command
      "# #{@description}\nalias #{@alias}=\"#{@command}\"\n"
    end
  end
end
