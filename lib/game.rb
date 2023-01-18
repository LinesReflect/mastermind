class Game
  attr_accessor :breaker, :coder

  def initialize(breaker, coder)
    @breaker = breaker
    @coder = coder
  end

  def start_game
    @turns_left = 15
    recieve_code
    compare_codes
  end

  def recieve_code
    @code = @coder.create_code
  end

  def recieve_guess
    @guess = @breaker.guess_code
  end

  def compare_codes
    recieve_guess
    if @guess == @code
      puts "Correct!"
    else
      @turns_left -= 1
      puts "Try again. #{@turns_left} tries left!"
    end
    compare_codes
  end
end
