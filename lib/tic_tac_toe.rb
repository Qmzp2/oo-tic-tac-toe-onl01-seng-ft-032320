class TicTacToe
  
  def initialize(board = [])
    
  end
  
  def play
    @board = Array.new(9, " ")
    turn until over?
    won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
    puts "Would you like to play again? (Y or N)"
    gets == "Y" ? play : puts "(Goodbye!)"
  end
  
  
  def turn
    puts "Player #{player}, please enter a number 1-9:"
    input = gets
    index = input_to_index(input)
    play = player
    if valid_move?(index)
      move(index, play)
      display_board
    else
      turn
    end
  end
  
end

