class Game
  def initialize
    @positions = Array.new(9) { " " }
  end

  def valid_next_moves
    valid = []
    @positions.each_with_index do |piece, index|
      valid << index if piece == " "   
    end
    valid
  end

  def at(pos)
    @positions[pos]
  end

  def move(pos, player)
    raise IllegalMoveError if at(pos) != " "
    @positions[pos] = player.piece
  end

  def won?(player)
    winning_combos = [/###....../]
    winning_combos.each do |combo|
      return true if @positions.join.gsub(player.piece, "#").match combo
    end
    false
  end
end

class IllegalMoveError < Exception; end
