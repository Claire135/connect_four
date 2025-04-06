# frozen_string_literal: true

# module for generating board display
# included methods: #display_board(board)
# included in PlayGame class

module BoardDisplay
  def display_board(board)
    # board is structured as columns: board[0] = column 1
    # Transpose it to print by rows (row 5 → row 0)
    5.downto(0) do |row|
      row_output = board.map { |col| col[row] }.join(' | ')
      puts " #{row_output} "
    end
    puts '-----------------------------'
    puts ' 1   2   3   4   5   6   7'
  end
end
