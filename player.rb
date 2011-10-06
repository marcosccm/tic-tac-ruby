class Player
  attr_accessor :piece, :opponent, :sign

  def initialize(piece, sign)
    @piece = piece    
    @sign = sign    
  end
end
