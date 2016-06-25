module Sobriquet
  # Contain a collection of commands
  class CommandCollection
    def initialize(persistance)
      @persistance = persistance
      @commands = []
      @title = %w(command alias description)
    end

    def get
      @commands
    end

    def add(data)
      @commands.push(data)
      @persistance.save(@commands, @title)
    end
    def compile
      'alias gs="git status"'
    end
  end
end
