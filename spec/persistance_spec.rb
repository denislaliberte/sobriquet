require 'sobriquet'
include Sobriquet

RSpec.describe Persistance do
  let(:data) do
    'command | alias | description
git status | gs | get the status of the git directory'
  end

  it 'retrive the command data from csv' do
    expect(File).to receive(:open).with(any_args) { StringIO.new(data) }
    persistance = described_class.new
    expect(persistance.get.first.command).to eq('alias gs="git status"')
  end
end
