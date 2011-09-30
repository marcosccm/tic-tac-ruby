class NegaMax
  def next_move(game, player)
    return 1  if game.won?(player)
    return -1 if game.won?(player.opponent)

    best = -inf
    game.valid_next_moves.each do |index|
      game.move(index, player)
      value = -next_move(game, player.opponent)
      best = value if value > best
      game.undo(index)
    end
   
    return 0 if best == -inf
    best 
  end
end

class Game
  def initialize
    @positions = Array.new(8) { " " }
  end

  def valid_next_moves
    valid = []
    @positions.each_with_index do |piece, index|
      valid << index if piece == " "   
    end
    valid
  end

  def move

  end
end
