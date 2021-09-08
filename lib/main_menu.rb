require './lib/game.rb'
require './lib/printer.rb'

class MainMenu

  def initialize
  end

  def menu
    printer = Printer.new
    printer.welcome
    input = $stdin.gets.chomp

    if input.downcase == "p" || input.downcase == "play"
      game = create_game
      start_game(game)
    elsif input.downcase == "i" || input.downcase == "instructions"
      printer.instructions
      menu
    elsif input.downcase == "q" || input.downcase == "quit"
      printer.quit_menu
    else
      puts "Input not understood."
      menu
    end
  end

  def create_game
    Game.new
  end

  def start_game(game)
    game.start
  end
end
