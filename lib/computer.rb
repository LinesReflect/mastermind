
require_relative "breaker.rb"
require_relative "coder.rb"

class Computer
  include Breaker
  include Coder
  attr_accessor :role

  def initialize(role)
    @role = role
    @possible_numbers = [*0..9]
    @included_numbers = []
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
    print "Thinking..."
    sleep(2)
    if feedback.any? { |data| data == "" }
      @guess = Array.new(4, "")
      random_numbers(@guess)
    else
      educated_guess(feedback)
    end
    puts @guess.join("")
    @guess
  end

  def educated_guess(data)
    data.map.with_index do |num, idx|
      if num.instance_of? Integer
        @guess[idx] = @guess[idx]
      elsif num == "O"
        @included_numbers.push(@guess[idx]) if @included_numbers.none?(@guess[idx])
        @guess[idx] = @possible_numbers.sample
      else
        @possible_numbers.delete(@guess[idx])
        @guess[idx] = @included_numbers.empty? ? @possible_numbers.sample : @included_numbers.sample
      end
    end
  end
end
