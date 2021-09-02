require 'rspec'
require './lib/sequence.rb'

RSpec.describe do
  it 'exists' do
    sequence = Sequence.new

    expect(sequence).to be_a Sequence
  end

  it 'generates a sequence' do
    sequence = Sequence.new
    code = sequence.generate

    expect(code.length).to eq 4
    p code
  end
end
