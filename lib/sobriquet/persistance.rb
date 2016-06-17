require 'CSV'

module Sobriquet
  # Persistance handle interaction with the file system
  class Persistance
    def initialize(workspace)
      @workspace = workspace
    end

    def get
      _title, *data = CSV.read(@workspace, 'rb', col_sep: ' | ')
      data.map { |a| Command.new(a) }
    end

    def save(commands, title)
      csv_string = CSV.generate(col_sep: ' | ') do |csv|
        csv.add_row(title)
        commands.map do |line|
          csv.add_row(line)
        end
      end
      File.open(@workspace, 'w') do |file|
        file.write(csv_string)
      end
    end
  end
end
