require './lib/sequence.rb'
require './lib/evaluator.rb'
require './lib/startup.rb'

class Game

  attr_reader   :difficulty,
                :code,
                :colors

  def initialize(difficulty = "Beginner")
    @difficulty = difficulty
    @sequence   = Sequence.new(@difficulty)
    @code       = @sequence.generate
    @colors     = @sequence.colors
  end

  def start
    puts "I have generated a #{difficulty} sequence with four elements made up of:"
    puts "#{colors}"
    puts "Use (q)uit at any time to end the game."
    puts "What's your guess?"
    print ">"

    turn_flow

  end

  def turn_flow

    start_time = Time.now
    correct_positions = 0
    turn_counter = 0

    until correct_positions == 4

      input = $stdin.gets.chomp

      if input.downcase == "q" || input.downcase == "quit"
        quit
        break
      elsif input.downcase == "c" || input.downcase == "cheat"
        puts @code
      elsif input.length < 4
        puts "Too short, guess again"
      elsif input.length > 4
        puts "Too long, guess again"
      else
        evaluator = Evaluator.new(input, @code)
        correct_colors = evaluator.compare_colors(input)
        correct_positions = evaluator.compare_positions(input)
        turn_counter += 1
        if winner?(correct_positions)
          end_time = Time.now
          elapsed_time = end_time - start_time
          elapsed_time_minutes = end_time.min - start_time.min

          puts "Congratulations! You guessed the sequence #{@code} in #{turn_counter} guesses over #{elapsed_time_minutes} minutes and #{(elapsed_time % 60).to_i} seconds"
        else
          puts "You have #{correct_colors} correct colors and #{correct_positions} are in the correct positions" ## can't get this to not print when we win yet
        end
      end
    end
  end

  def quit
    puts "Quit the game? Press (q) again to exit to the main menu, or any other key to return to the game."
    print ">"
    input = gets.chomp.downcase

    if input == 'q'
      puts "Game abandoned."
      puts "-" * 70
      startup = Startup.new
      startup.intro
    end
  end

  def winner?(correct_positions)
    correct_positions == 4
  end
end
