require "./tic_tac_toe"

player1 = HumanPlayer.new("X", -1)
player2 = AiPlayer.new("0", 1)

player1.opponent = player2
player2.opponent = player1

game = Game.new(player1, player2)
game.run
