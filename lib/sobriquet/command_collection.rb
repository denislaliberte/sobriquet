module Sobriquet
  # Contain a collection of commands
  class CommandCollection
    def initialize(persistance)
      @persistance = persistance
      @commands = []
      @title = ['command', 'alias', 'description']
    end

    def get
      @commands
    end

    def add(data)
      @commands.push(data)
      @persistance.save(@commands, @title)
    end
  end
end
