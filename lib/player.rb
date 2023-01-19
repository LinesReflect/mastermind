class Player
  attr_accessor :role

  def initialize(role)
    @role = role
  end

  def guess_code
    puts "Enter a valid guess."
    @guess = gets.chomp
    @guess.to_s.length == 4 ? @guess.to_s.split(//) : guess_code
  end
end
