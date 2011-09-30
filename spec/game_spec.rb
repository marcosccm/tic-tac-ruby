require_relative "../game"

describe Game do
  describe "an empty game" do
    let(:game) { Game.new }
    it { game.valid_next_moves.size.should == 9 }
  end

  describe "player making moves" do
    let(:game) { Game.new }
    let(:player) { stub }
    
    before :each do
      player.should_receive(:piece).and_return("x")
      game.move(0,player)
    end

    describe "a legal move" do
      it { game.at(0).should == "x" }
      it { game.valid_next_moves.size.should == 8 }
    end

    describe "an illegal move" do
      it "raises an error" do
        expect { game.move(0, player) }.to raise_error IllegalMoveError
      end
    end
  end

  describe "evaluating the game" do
    let(:game) { Game.new }
    let(:player) { stub(:piece => "#") }

    it "player wins with a horizontal row" do
      game.move(0, player)
      game.move(1, player)
      game.move(2, player)

      game.won?(player).should be_true
    end
  end
end
