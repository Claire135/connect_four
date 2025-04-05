class Board
  attr_reader :board

  def initialize
    @board = Array.new(7) { Array.new(6, '_') }
  end

  def board_full?
    @board.flatten.none? { |cell| cell == '_'}
  end

  def drop_piece(column, piece)
    column -= 1
    row = @board[column].index('_')
    return invalid_move_message unless valid_move?(column)
    @board[column][row] = piece
  end
  
  private  
  def valid_move?(column)
    @board[column].include?('_')
  end

  def invalid_move_message
    'Invalid move! Column is full.'
  end
end