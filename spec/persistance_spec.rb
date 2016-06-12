require 'sobriquet'
include Sobriquet

RSpec.describe Persistance do
  let(:data) do
    'command | alias | description
git status | gs | get the status of the git directory'
  end
  let(:result) do
    '# get the status of the git directory
alias gs="git status"
'
  end

  it 'retrive the command data from csv' do
    expect(File).to receive(:open).with(any_args) { StringIO.new(data) }
    persistance = described_class.new('workspace.csv')
    expect(persistance.get.first.command).to eq(result)
  end
end
