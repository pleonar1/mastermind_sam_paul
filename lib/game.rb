require './lib/sequence.rb'
require './lib/evaluator.rb'
require './lib/main_menu.rb'
require './lib/printer.rb'

class Game

  attr_reader   :difficulty,
                :code,
                :colors

  def initialize(difficulty = "Beginner")
    @difficulty = difficulty
    @sequence   = Sequence.new(@difficulty)
    @code       = @sequence.generate
    @colors     = @sequence.colors
    @printer    = Printer.new
  end

  def start
    @printer.start_game(@difficulty)
    turn_flow
  end

  def valid_input?(input)
    if @difficulty == "Beginner"
      if input.length < 4
        puts "Too short, guess again"
        false
      elsif input.length > 4
        puts "Too long, guess again"
        false
      end
    elsif @difficulty == "Intermediate"
      if input.length < 6
        puts "Too short, guess again"
        false
      elsif input.length > 6
        puts "Too long, guess again"
        false
      end
    elsif @difficulty == "Advanced"
      if input.length < 8
        puts "Too short, guess again"
        false
      elsif input.length > 8
        puts "Too long, guess again"
        false
      end
    end
  end

  def turn_flow
    time = Time.now
    correct_positions = 0
    turn_counter = 0

    until correct_positions == 4
      @printer.input
      input = $stdin.gets.chomp

      if input.downcase == "q" || input.downcase == "quit"
        quit
        break
      elsif input.downcase == "c" || input.downcase == "cheat"
        puts @code
      elsif valid_input?(input) == false
      else
        evaluator = Evaluator.new(@code)
        correct_colors = evaluator.compare_colors(input)
        correct_positions = evaluator.compare_positions(input)
        turn_counter += 1

        if winner?(evaluator.compare_positions(input))
          game_end(time, turn_counter)
          break
        else
          @printer.evaluation(correct_colors, correct_positions)
          @printer.turn_counter(turn_counter)
        end
      end
    end
  end

  def quit
    @printer.quit
    menu = MainMenu.new
    menu.menu
  end

  def winner?(correct_positions)
    correct_positions == 4
  end

  def elapsed_time(time)
    mins_secs = []
    elapsed_time = Time.now - time

    mins_secs << (elapsed_time).to_i / 60 # minutes (index 0)
    mins_secs << (elapsed_time % 60).to_i # seconds (index 1)

    mins_secs
  end

  def game_end(time, turn_counter)
    final_time = elapsed_time(time)
    @printer.end_game(@code, turn_counter, final_time)
  end
end
