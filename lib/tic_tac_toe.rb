class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2] ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def input_to_index(n)
    return n.to_i - 1
  end 
  
  def valid_move?(index)
    (index >= 0 && index <= 8) && !position_taken?(index)
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def move(index)
    @board[index] = current_player
  end

  def turn
    index = input_to_index(gets.strip)
    if(valid_move?(index))
      puts "good"
      move(index)
    else
      turn
    end
  end
  
  def play
    puts "Enter input (1-9):"
    while(!over?)
      turn
      display_board
    end
    if(!draw?)
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end 
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end