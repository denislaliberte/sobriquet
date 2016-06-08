require 'sobriquet'
include Sobriquet

RSpec.describe Persistance do
  let(:data) { 'command | alias | description
git status | gs | get the status of the git directory'}

  it "retrive the command data from csv" do
    expect(File).to receive(:open).with(any_args) { StringIO.new(data) }
    persistance = Persistance.new
    expect(persistance.get.first.command).to eq('alias gs="git status"')
  end
end
