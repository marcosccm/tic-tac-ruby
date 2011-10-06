class GameBoard
  def draw(a)
    board = <<-EOF 
        |   |    
      #{a[0]} | #{a[1]} | #{a[2]} 
        |   |
     ---+---+---
        |   |
      #{a[3]} | #{a[4]} | #{a[5]} 
        |   |
     ---+---+---
        |   |
      #{a[6]} | #{a[7]} | #{a[8]} 
        |   |
    EOF

    puts "=================="
    puts board
    puts "=================="
  end
end
