class Game
  attr_accessor :breaker, :coder

  def initialize(breaker, coder)
    @breaker = breaker
    @coder = coder
  end

  def start_game
    @turns_left = 15
    @feedback = Array.new(4, "")
    recieve_code
    compare_codes
  end

  def recieve_code
    @code = @coder.create_code
    print @code
  end

  def recieve_guess
    @guess = @breaker.guess_code
    @guess = @guess.map { |num| num.to_i }
  end

  def compare_codes
    recieve_guess
    if @guess == @code
      puts "Correct!"
    else
      @turns_left -= 1
      print give_feedback(@code, @guess)
    end
    compare_codes
  end

  def give_feedback(code, guess)
    code.map.with_index do |num, idx|
      if @feedback[idx].instance_of? String
        @feedback[idx] = (guess.include?(num) ? "O" : "X")
        @feedback[idx] = num if num == guess[idx]
      end
    end
    return @feedback
  end
end
