require 'sobriquet'
include Sobriquet

RSpec.describe CommandCollection do
  let(:command_data) do
    ['git status', 'gs', 'get the status of the git directory']
  end

  it 'add a new commands' do
    expect(Persistance).to receive(:new).with('sobriquet.csv')
    commands = described_class.new('sobriquet.csv')
    commands.add(command_data)
    expect(commands.get).to include(command_data)
  end
end
