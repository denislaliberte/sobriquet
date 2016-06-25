require 'sobriquet'
include Sobriquet

RSpec.describe CommandCollection do
  let(:command_data) do
    ['git status', 'gs', 'get the status of the git directory']
  end

  it 'add and get a new command' do
    persistance = instance_double('Persistance', 'workspace/path')
    allow(persistance).to receive(:save)
    commands = described_class.new(persistance)
    commands.add(command_data)
    expect(commands.get).to include(command_data)
  end

  it 'add and persist a new command' do
    persistance = instance_double('Persistance', 'workspace/path')
    expect(persistance).to receive(:save).with([command_data], any_args)
    commands = described_class.new(persistance)
    commands.add(command_data)
  end

  it 'compile command to script file' do
    persistance = instance_double('Persistance', 'workspace/path')
    commands = described_class.new(persistance)
    expect(commands.compile).to include('alias gs="git status"')
  end
end
