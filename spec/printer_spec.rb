require 'rspec'
require './lib/printer.rb'

RSpec.describe do
  before :each do
    @printer = Printer.new
  end

  it 'prints a welcome message' do
    expect(@printer.welcome).to eq nil
  end

  it 'prints instructions' do
    expect(@printer.instructions).to eq nil
  end

  it 'prints a start message' do
    difficulty1 = "Beginner"
    difficulty2 = "Intermediate"
    difficulty3 = "Advanced"

    expect(@printer.start_game(difficulty1)).to eq "What's your guess?"
    expect(@printer.start_game(difficulty2)).to eq "What's your guess?"
    expect(@printer.start_game(difficulty3)).to eq "What's your guess?"
  end

  it 'prompts inputs' do
    expect(@printer.input).to eq nil
  end

  it 'evaluates' do
    expect(@printer.evaluation(3, 2)).to eq "You have 3 correct colors and 2 are in the correct positions"
  end

  xit 'counts turns' do
    expect(@printer.turn_counter(1)).to eq "You've taken 1 guess.\n\n"
    expect(@printer.turn_counter(2)).to eq "You've taken 2 guesses.\n\n"
  end

  xit 'prints a message at the end of the game' do
    code = ['R','B','Y','B']
    turn_counter = 10
    final_time = [4, 30]

    expect(@printer.end_game(code, turn_counter, final_time)).to eq "Congratulations! You guessed the sequence #{code} in #{turn_counter} guesses over #{final_time[0]} minutes and #{final_time[1]} seconds."
  end

  it 'prints a quit game message' do
    expect(@printer.quit_game).to eq "-" * 70
  end

  it 'prints a quit menu message' do
    expect(@printer.quit_menu).to eq 'Have a nice day!'
  end
end
