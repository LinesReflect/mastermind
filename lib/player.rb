require_relative "breaker"
require_relative "coder"

class Player
  include Breaker
  include Coder
  attr_accessor :role

  def initialize(role)
    @role = role
  end
end
