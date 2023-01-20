
require_relative "breaker.rb"
require_relative "coder.rb"

class Computer
  include Breaker
  include Coder
  attr_accessor :role

  def initialize(role)
    @role = role
    @guessed_numbers = []
  end

  def random_numbers(arr)
    0.upto(3) { |num| arr[num] = rand(0..9) }
  end

  def create_code
    @code = []
    random_numbers(@code)
    @code
  end

  def guess_code(feedback)
    @guess = Array.new(4, "")
    if feedback
      sleep(2)
      educated_guess(feedback)
    else
      random_numbers(@guess)
    end
    puts @guess.join("")
    @guess
  end

  def educated_guess(data)
    data.map.with_index do |num, idx|
      if num.instance_of? Integer
        @guess[idx] = num
      elsif num == "O"
        @guess[idx + 1] = num
      else
        @guess[idx] = rand(0..9)
      end
    end
  end
end
