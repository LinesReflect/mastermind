module Breaker
  def guess_code(feedback)
    puts "Enter a valid guess."
    @guess = gets.chomp
    @guess.length == 4 ? @guess.split(//) : guess_code
  end
end
