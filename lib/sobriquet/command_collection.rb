require 'mustache'
require 'yaml'
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
      Mustache.render(
        '{{#commands}}
# description : {{description}}
alias {{alias}}="{{value}}"
        {{/commands}}
{{#variables}}
# description : {{description}}
export {{alias}}="{{value}}"
        {{/variables}}',
        commands: @persistance.get,
        variables: @persistance.get
      )
    end
  end
end
