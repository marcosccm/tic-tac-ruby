require "./game_board"
class Game
  attr_accessor :positions, :player1, :player2
  def initialize(positions=nil, player1, player2)
    @positions ||= Array.new(9) { " " }
    @player1 = player1
    @player2 = player2
  end

  def run
    loop do
      move(@player2.move(self), @player2)
      draw
      break if over?
      move(@player1.move(self), @player1)
      draw
      break if over?
    end

    draw_winning
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
    raise IllegalMoveError, "position #{pos} with #{@positions[pos]}" if at(pos) != " "
    @positions[pos] = player.piece
  end

  def undo(pos)
    @positions[pos] = " "
  end

  def draw(printer=GameBoard)
    printer.new.draw(@positions)
  end

  def draw_winning
    puts "the game is over"
    draw
    puts "#{@player1} wins" if won?(@player1) 
    puts "#{@player2} wins" if won?(@player2) 
    puts "it's a draw" if draw?
  end

  def over?
    won?(@player1) || won?(@player2) || draw?
  end

  def draw?
    @positions.all? { |x| x != " " }
  end

  def full?
    @positions.all? { |x| x != " " }
  end

  def empty?
    @positions.all? { |x| x == " " }
  end

  def won?(player)
    winning_combos = [
      /###....../,
      /...###.../,
      /......###/,
      /#..#..#../,
      /.#..#..#./,
      /..#..#..#/,
      /#...#...#/,
      /..#.#.#../
    ]
    winning_combos.any? { |x| @positions.join.gsub(player.piece, "#").match x } 
  end

  def temp
    Game.new(@positions.to_a, @player1, @player2)
  end
end

class IllegalMoveError < Exception; end
