require_relative "breaker.rb"
require_relative "coder.rb"

class Computer
  include Breaker
  include Coder
  attr_accessor :role

  def initialize(role)
    @role = role
  end

  def create_code
    @code = []
    0.upto(3) { |num| @code[num] = rand(0..9) }
    @code
  end
end
