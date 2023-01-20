module Coder
  def create_code
    puts "Enter a secret 4 digit code."
    @code = gets.chomp
    @code.length == 4 ? @code.split(//) : create_code
  end
end
