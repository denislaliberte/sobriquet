require 'CSV'

module Sobriquet
  # Persistance handle interaction with the file system
  class Persistance
    def initialize(workspace)
      @workspace = workspace
    end

    def get
      _title, *data = CSV.read('sobriquet.csv', 'rb', col_sep: ' | ')
      data.map { |a| Command.new(a) }
    end

    def save(commands)
    end
  end
end
