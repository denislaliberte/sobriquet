require 'sobriquet'
include Sobriquet

RSpec.describe Persistance do
  let(:title) do
    %w(command alias description)
  end
  let(:csv) do
    'command | alias | description
"git status" | gs | "get the status of the git directory"
'
  end
  let(:compiled_command) do
    '# get the status of the git directory
alias gs="git status"
'
  end
  let(:data) do
    [
      ['git status', 'gs', 'get the status of the git directory']
    ]
  end

  it 'retrive the command csv from csv' do
    expect(File).to receive(:open).with(any_args) { StringIO.new(csv) }
    persistance = described_class.new('workspace.csv')
    first_command = persistance.get.first
    expect(first_command.value).to eq('git status')
    expect(first_command.alias).to eq('gs')
    expect(first_command.description).to eq('get the status of the git directory')
  end

  it 'save the commands data to the csv' do
    file = instance_double('file')
    expect(File).to receive(:open).with(any_args).and_yield(file)
    expect(file).to receive(:write).with(csv)
    persistance = described_class.new('workspace.csv')
    persistance.save(data, title)
  end
end
