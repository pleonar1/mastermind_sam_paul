require 'rspec'
require './lib/startup.rb'

RSpec.describe do

  before :each do
    @startup = Startup.new
  end

  context "initialize" do
    it "exists" do
      expect(@startup).to be_a Startup
    end
  end

  context "it can start" do
    it "can play" do
    end

    it "can give instructions" do
      expect(@startup.instructions).to eq('abc')
    end

    it "can quit" do
      expect(@startup.quit).to eq('Goodbye')
    end
  end
end
