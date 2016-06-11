require 'sobriquet'
include Sobriquet

RSpec.describe CommandCollection do
  it 'blablabla' do
    commands = described_class.new('sobriquet.csv')
    #sobriquet.addCommand(['git status','gs','get the status of the git directory'])
  end
end
