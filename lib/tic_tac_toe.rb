class TicTacToe

  def initialize(board = [])
     @board = Array.new(9, " ")
  end
  
def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
   #b/c its counts at 0, so this puts w/e the player puts and subtracts 1
  def input_to_index(input)
    input.to_i - 1 
  end
  
   def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !(position_taken?(index))
  end

def turn
	puts "Please enter 1-9:"
	user_input = gets.chomp
	index = input_to_index(user_input)
	if valid_move?(index) == true && current_player == "X"
	  move(index, value = "X")
		puts display_board
	elsif valid_move?(index) == true && current_player == "O"
		move(index, value = "O")
		puts display_board
	elsif valid_move?(index) == false
		puts "Please enter 1-9:"
		input = gets.chomp
	else 
		puts "Please enter 1-9:"
		input = gets.chomp
	end
end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    a = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    b = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return a || b
  end
  
  def full?
    !@board.any?{|x| x == "" || x == " "}
  end
  
  
  def over?
    won? || draw?
  end

def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end
  
def play
    while over? == false
    	turn
    end

    if draw?
    puts "Cat's Game!"
    elsif winner == "X" 
    puts "Congratulations X!"
    elsif winner == "O"
    puts "Congratulations O!"
end
end

def draw?
    !won? && full?
  end
  
  WIN_COMBINATIONS = [
    # Reminder: Here are the positions. Starts with 0!!!
    #   0 | 1 | 2
    #  -----------
    #   3 | 4 | 5
    #  -----------
    #   6 | 7 | 8

    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left collum
    [1,4,7],  # Middle collum
    [2,5,8],  # Right collum
    [0,4,8],  # Diagnol 1
    [2,4,6]  # Diagnol 2
    #Hope I didn't miss any! 
  ]

 
  

end