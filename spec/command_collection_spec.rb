require 'sobriquet'
include Sobriquet

RSpec.describe CommandCollection do
  it 'blablabla' do
    expect(Persistance).to receive(:new).with('sobriquet.csv')
    commands = described_class.new('sobriquet.csv')
    commands.add(['git status', 'gs', 'get the status of the git directory'])
  end
end
