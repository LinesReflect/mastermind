class Game
  attr_accessor :breaker, :coder

  def initialize(breaker, coder)
    @breaker = breaker
    @coder = coder
  end

  def start_game
    rules
    @turns_left = 12
    @feedback = Array.new(4, "")
    recieve_code
    recieve_guess
  end

  def rules
    puts "Feedback:
      A shown number means you have a correct number and it is in the correct spot.
      An 'O' means you have a correct number in an incorrect spot.
      An 'X' means that number is not in the secret code."
  end

  def recieve_code
    @code = @coder.create_code
    @code = @code.map { |num| num.to_i }
  end

  def recieve_guess
    @guess = @breaker.guess_code(@feedback)
    @guess = @guess.map { |num| num.to_i }
    compare_codes
  end

  def compare_codes
    print winner? ? breaker_won : next_turn
  end

  def give_feedback(code, guess)
    code.map.with_index do |num, idx|
      if @feedback[idx].instance_of? String
        @feedback[idx] = (code.include?(guess[idx]) ? "O" : "X")
        @feedback[idx] = num if num == guess[idx]
      end
    end
    return @feedback
  end

  def winner?
    @guess == @code
  end

  def breaker_won
    puts "Congrats breaker, you cracked the code. It was: #{@code.join("")}!"
    end_game
  end

  def coder_won
    puts "Congrats coder, your code was not cracked! The code was: #{@code.join("")}!"
    end_game
  end

  def next_turn
    @turns_left -= 1
    puts "#{give_feedback(@code, @guess)}, #{@turns_left} turns left."
    no_turns_left? ? coder_won : recieve_guess
  end

  def no_turns_left?
    @turns_left.zero?
  end

  def end_game
    return
  end
end
