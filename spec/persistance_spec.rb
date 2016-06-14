require 'sobriquet'
include Sobriquet

RSpec.describe Persistance do
  let(:title) do
    ['command','alias','description']
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
    persistance = described_class.new('workspace.csv', title)
    expect(persistance.get.first.command).to eq(compiled_command)
  end

  it 'save the commands data to the csv' do
    file = spy('file')
    expect(File).to receive(:open).with(any_args).and_yield(file)
    persistance = described_class.new('workspace.csv', title)
    persistance.save(data)
    expect(file).to have_received(:write).with(csv)
  end
end
