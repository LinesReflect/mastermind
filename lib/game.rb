class Game
  attr_accessor :breaker, :coder

  def initialize(breaker, coder)
    @breaker = breaker
    @coder = coder
  end

  def recieve_code
    @code = @coder.create_code
  end
end
