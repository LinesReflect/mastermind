require_relative "breaker.rb"
require_relative "coder.rb"

class Player
  include Breaker
  include Coder
  attr_accessor :role

  def initialize(role)
    @role = role
  end
end
