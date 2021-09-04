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
      play
    elsif input.downcase == "i" || input.downcase == "instructions"
      printer.instructions
      menu
    elsif input.downcase == "q" || input.downcase == "quit"
      quit
    else
      puts "Input not understood."
      menu
    end
  end

  def play
    game = Game.new
    game.start
  end

  def instructions
    printer.instructions
    menu
  end

  def quit
    p "Have a nice day!"
  end
end
