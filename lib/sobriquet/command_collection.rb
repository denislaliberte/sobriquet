module Sobriquet
  # Contain a collection of commands
  class CommandCollection
    def initialize(persistance)
      @persistance = persistance
      @commands = []
    end

    def get
      @commands
    end

    def add(data)
      @commands.push(data)
    end
  end
end
