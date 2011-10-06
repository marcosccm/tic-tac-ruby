require_relative "./../minimax"

describe NegaMax do
  let(:game) { Game.new } 

  describe "calculates next best move" do
    it "does not blow" do
      player1 = Player.new("X", 1)
      player2 = Player.new("O", -1)
      player1.opponent = player2
      player2.opponent = player1

      nega = NegaMax.new
      nega.best_move(game, player1).should == "a"
    end
  end
end
