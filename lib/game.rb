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

  def evaluate
    evaluator ||= Evaluator.new(@code)  # memoization: var either already holds a value and you don't need to instantiate, OR it's nil, and we will set it to this object.
                                        # forces us to only instantiate it once
  end

  def correct_colors(input)
    evaluate.compare_colors(input)
  end

  def correct_positions(input)
    evaluate.compare_positions(input)
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
      elsif evaluate.valid_input?(input, @difficulty) == false
      else
        correct_colors = correct_colors(input)
        correct_positions = correct_positions(input)
        turn_counter += 1

        if winner?(correct_positions)
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

    input = $stdin.gets.chomp
    if input.downcase == "p" || input.downcase == "play"
      @code = @sequence.generate
      start
    end
  end
end
