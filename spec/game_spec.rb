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

    it "player wins with top horizontal row" do
      game.move(0, player)
      game.move(1, player)
      game.move(2, player)

      game.won?(player).should be_true
    end

    it "player wins with middle horizontal row" do
      game.move(3, player)
      game.move(4, player)
      game.move(5, player)

      game.won?(player).should be_true
    end

    it "player wins with bottom horizontal row" do
      game.move(6, player)
      game.move(7, player)
      game.move(8, player)

      game.won?(player).should be_true
    end

    it "player wins with first vertical row" do
      game.move(0, player)
      game.move(3, player)
      game.move(6, player)

      game.won?(player).should be_true
    end

    it "player wins with second vertical row" do
      game.move(1, player)
      game.move(4, player)
      game.move(7, player)

      game.won?(player).should be_true
    end

    it "player wins with third vertical row" do
      game.move(2, player)
      game.move(5, player)
      game.move(8, player)

      game.won?(player).should be_true
    end

    it "player wins with left diagonal row" do
      game.move(0, player)
      game.move(4, player)
      game.move(8, player)

      game.won?(player).should be_true
    end

    it "player wins with right diagonal row" do
      game.move(2, player)
      game.move(4, player)
      game.move(6, player)

      game.won?(player).should be_true
    end
  end
end
