class Player
  @@board = Array.new(3) {Array.new(3, 0)}
  attr_accessor :sym
  def initialize(sym)
    @sym = sym
  end

  def self.set_board(theboard)
    @@board = theboard
  end

  #protected
  def play(player, i, j)
    if @@board[i][j] != 0
      puts "This position already has value"
      return
    end
    @@board[i][j] = player.sym
    p @@board

  end
  #protected
  def judge_win(player)
    for i in 0..2
      if @@board[i].all? {|num| num == player.sym}
        return true
      end
      if @@board.transpose[i].all? {|num| num == player.sym}
        return true
      end
    end
    if [@@board[0][0], @@board[1][1], @@board[2][2]].all? {|num| num == player.sym}
        return true
    end
    if [@@board[0][2], @@board[1][1], @@board[2][0]].all? {|num| num == player.sym}
        return true
    end
    return false


  end
end

def main
  player1 = Player.new("@")
  player2 = Player.new("#")
  while true do
    puts "player1 please input"
    input1 = gets.chomp.split()
    player1.play(player1, input1[0].to_i, input1[1].to_i)
    if(player1.judge_win(player1))
      puts "player1 Wins!"
      Player.set_board(Array.new(3) {Array.new(3, 0)})
      break
    end
    puts "player2 please input"
    input2 = gets.chomp.split()
    player2.play(player2, input2[0].to_i, input2[1].to_i)
    if(player2.judge_win(player2))
      puts "player2 Wins!"
      Player.set_board(Array.new(3) {Array.new(3, 0)})
      break
    end
  end
end

main()
