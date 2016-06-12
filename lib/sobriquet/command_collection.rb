module Sobriquet
  # Command hold value and compile to executable string
  class CommandCollection
    def initialize(workspace)
      @workspace = workspace
      @persistance = Persistance.new(workspace)
    end

    def add(data)
    end
  end
end
