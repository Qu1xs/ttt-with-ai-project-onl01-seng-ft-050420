class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  
  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end
  
    #   if position_1 == "X" && position_2 == "X" && position_3 == "X"
    #   return win_combo
    # elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    #   return win_combo
    # end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]]
    end
  end
  
  def full?
    @board.all?{|occupied| occupied != " "}
  end
  
  def draw?
    !won? && @board.full?

  end
  
  def over?
    won? || draw? ? true : false
  end
  
    def winner
        if won? && player_1
          return "X"
        elsif won? && player_2
          return "X"
        else    
          nil
        end
    end
  
  # def turn 
  #   if !@board.valid_move?(move)
  #     turn
  #   else
  #     puts turn
  #   end
  # end 
  
  def play
    until over? == true
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw? 
      puts "Cat's Game!"
    end
  end
  
  
end