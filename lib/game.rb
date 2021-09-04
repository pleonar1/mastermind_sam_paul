require './lib/sequence.rb'
require './lib/evaluator.rb'
require './lib/main_menu.rb'

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

  def valid_input?(input)
    if input.length < 4
      puts "Too short, guess again"
      false
    elsif input.length > 4
      puts "Too long, guess again"
      false
    end
  end

  def turn_flow
    time = start_time
    correct_positions = 0
    turn_counter = 0

    until correct_positions == 4

      input = $stdin.gets.chomp

      if input.downcase == "q" || input.downcase == "quit"
        quit
        break
      elsif input.downcase == "c" || input.downcase == "cheat"
        puts @code
      elsif valid_input?(input) == false
      else
        evaluator = Evaluator.new(input, @code)
        correct_colors = evaluator.compare_colors(input)
        correct_positions = evaluator.compare_positions(input)
        turn_counter += 1
        if winner?(correct_positions)
          game_end(time, turn_counter)
          break
        else
          puts "You have #{correct_colors} correct colors and #{correct_positions} are in the correct positions"
          if turn_counter != 1
            puts "You've taken #{turn_counter} guesses."
          else
            puts "You've taken 1 guess."
          end
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
      menu = MainMenu.new
      menu.menu
    end
  end

  def winner?(correct_positions)
    correct_positions == 4
  end

  def start_time
    Time.now
  end

  def elapsed_time(time)
    mins_secs = []

    elapsed_time = Time.now - time

    mins_secs << (elapsed_time).to_i / 60 # minutes (index 0)
    mins_secs << (elapsed_time % 60).to_i # seconds (index 1)

    mins_secs
  end

  def game_end(time, turn_counter)
    turn_counter = turn_counter
    final_time = elapsed_time(time)

    puts "Congratulations! You guessed the sequence #{@code} in #{turn_counter} guesses over #{final_time[0]} minutes and #{final_time[1]} seconds"
  end
end
