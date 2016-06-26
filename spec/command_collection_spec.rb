require 'sobriquet'
include Sobriquet

RSpec.describe CommandCollection do
  let(:command_data) do
    ['git status', 'gs', 'get the status of the git directory']
  end
  let(:persistance) do
    instance_double('Persistance', 'workspace/path')
  end

  it 'add and get a new command' do
    allow(persistance).to receive(:save)
    commands = described_class.new(persistance)
    commands.add(command_data)
    expect(commands.get).to include(command_data)
  end

  it 'add and persist a new command' do
    expect(persistance).to receive(:save).with([command_data], any_args)
    commands = described_class.new(persistance)
    commands.add(command_data)
  end

  it 'compile command to script file' do
    allow(persistance).to receive(:get).and_return([Command.new(command_data)])
    commands = described_class.new(persistance)
    expect(commands.compile).to include('alias gs="git status"')
  end
  it 'script comain descrtion of commands' do
    allow(persistance).to receive(:get).and_return([Command.new(command_data)])
    commands = described_class.new(persistance)
    expect(commands.compile).to include(
      '# description : get the status of the git directory'
    )
  end
end
