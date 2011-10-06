require "./player"
class HumanPlayer < Player
  def move(game)
    puts "what's your next move?"
    gets.chomp.to_i
  end

  def to_s
    "you"
  end
end
