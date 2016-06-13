module Sobriquet
  # Contain a collection of commands
  class CommandCollection
    def initialize(workspace)
      @workspace = workspace
      @persistance = Persistance.new(workspace)
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
