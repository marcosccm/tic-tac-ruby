require "./minimax"

class AiPlayer < Player
  def initialize(*args)
    @algorithm = NegaScout.new
    super
  end

  def move(game)
    @algorithm.best_move(game, self)
  end

  def to_s
    "The AI"
  end
end
