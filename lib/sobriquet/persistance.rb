require 'CSV'

module Sobriquet
  # Persistance handle interaction with the file system
  class Persistance
    def get
      _title, *data = CSV.read('sobriquet.csv', 'rb', col_sep: ' | ')
      data.map { |a| Command.new(a) }
    end
  end
end
