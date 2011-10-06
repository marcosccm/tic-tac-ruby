require "./game"
require "./player"

Inf = 99999
class NegaScout
  def initialize
    @scores = Array.new(8) { -999 }
  end
  def best_move(game, player)
    @scores.fill(0, 8) { -999 }
    return 4 if game.empty?
    next_move(game, player, 1)
    puts @scores
    @scores.sort.reverse.first
  end

  def next_move(game, player, depth)
    return analysis(game, player) if game.full?

    max = -Inf
    game.valid_next_moves.each do |index|
      game.move(index, player)
      result = -next_move(game, player.opponent, depth+1)
      game.undo(index)
      @scores[index] = result if depth == 1
      if result > max
        max = result
      end
    end
   
    return max 
  end
  
  def analysis(game, player)
    return 1  if game.won?(player)
    return -1 if game.won?(player.opponent)
    0
  end
end
