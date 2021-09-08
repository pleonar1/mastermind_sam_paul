require './lib/game.rb'
require './lib/sequence.rb'

class Evaluator
  def initialize(code)
    @code = code
  end

  def compare_positions(input)
    guess = input.upcase.chars # => ['R', 'G', 'Y', 'R']
    correct_positions = 0

    (0..3).each do |index|
      if @code[index] == guess[index]
        correct_positions += 1
      end
    end
    correct_positions
  end

  def compare_colors(input)
    guess = input.upcase.chars # => ['R', 'G', 'Y', 'R']
    correct_colors = 0
    sequence = Sequence.new

    sequence.colors.each do |color|
      correct_colors += [guess.count(color), @code.count(color)].min
    end
    correct_colors
  end

  def valid_input?(input, difficulty = "Beginner")
    result = true
    if input.count("^RrBbYyGg") != 0 # the caret (^) tells us to look for any character EXCEPT the ones we've named
      puts "You many only guess a combination of 'R', 'B', 'G', or 'Y'"
      result = false
    elsif difficulty == "Beginner"
      if input.length < 4
        puts "Too short, guess again"
        result = false
      elsif input.length > 4
        puts "Too long, guess again"
        result = false
      end
    elsif difficulty == "Intermediate"
      if input.length < 6
        puts "Too short, guess again"
        result = false
      elsif input.length > 6
        puts "Too long, guess again"
        result = false
      end
    elsif difficulty == "Advanced"
      if input.length < 8
        puts "Too short, guess again"
        result = false
      elsif input.length > 8
        puts "Too long, guess again"
        result = false
      end
    end
    result
  end
end
