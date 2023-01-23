require_relative "game"
require_relative "player"
require_relative "computer"

def mastermind
  puts "Welcome to Mastermind! Please choose a role."
  puts "1: Breaker or 2: Coder"
  choose_role
  another_game
end

def choose_role
  role = gets.chomp.to_i
  if role == 1
    user = Player.new("Breaker")
    comp = Computer.new("Coder")
    new_game = Game.new(user, comp).start_game
  elsif role == 2
    user = Player.new("Coder")
    comp = Computer.new("Breaker")
    new_game = Game.new(comp, user).start_game
  else
    puts "Not a valid response. Choose 1 for Breaker or 2 for Coder!"
    choose_role
  end
end

def another_game
  puts "Would you like to play another game? Y/N"
  response = gets.chomp
  response == ("Y" || "y") ? mastermind : return
end

mastermind
