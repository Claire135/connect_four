module GameLogic
  def winner?(piece, board)
    (0..6).each do |col|
      (0..5).each do |row|
        return true if four_in_a_row?(col, row, 1, 0, piece, board) ||  # Horizontal →
        four_in_a_row?(col, row, 0, 1, piece, board) ||  # Vertical ↓
        four_in_a_row?(col, row, 1, 1, piece, board) ||  # Diagonal ↘
        four_in_a_row?(col, row, -1, 1, piece, board)    # Diagonal ↙
      end
    end
    false
  end

  private
  def four_in_a_row?(col, row, col_step, row_step, piece, board)
    4.times.all? do |i|
      c = col + col_step * i
      r = row + row_step * i
      next false if c < 0 || c > 6 || r < 0 || r > 5
      board[c][r] == piece
    end
  end
end





