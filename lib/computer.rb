class Computer
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
