require 'sobriquet'
include Sobriquet

RSpec.describe Persistance do
  let(:title) do
    %w(command alias description type)
  end
  let(:csv) do
    'command | alias | description | type
"git status" | gs | "get the status of the git directory" | command
"origin master" | om | "no description" | variable
'
  end

  let(:data) do
    [
      ['git status', 'gs', 'get the status of the git directory', 'command'],
      ['origin master', 'om', 'no description', 'variable']
    ]
  end

  context 'Reading csv with data' do
    before do
      expect(File).to receive(:open).with(any_args) { StringIO.new(csv) }
    end

    it 'retrive the command csv from csv and contain value' do
      persistance = described_class.new('workspace.csv')
      first_command = persistance.get('command').first
      expect(first_command.value).to eq('git status')
    end

    it 'return only the commands' do
      persistance = described_class.new('workspace.csv')
      expect(persistance.get('command').count).to eq(1)
    end

    it 'retrive the command csv from csv and contain alias' do
      persistance = described_class.new('workspace.csv')
      first_command = persistance.get('command').first
      expect(first_command.alias).to eq('gs')
    end

    it 'retrive the command csv from csv and contain description' do
      persistance = described_class.new('workspace.csv')
      first_command = persistance.get('command').first
      expect(first_command.description).to eq(
        'get the status of the git directory'
      )
    end
  end

  it 'save the commands data to the csv' do
    file = instance_double('file')
    expect(File).to receive(:open).with(any_args).and_yield(file)
    expect(file).to receive(:write).with(csv)
    persistance = described_class.new('workspace.csv')
    persistance.save(data, title)
  end
end
