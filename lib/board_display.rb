module BoardDisplay
  def display_board(board)
    board.each do |row|
      puts row.join('|')
    end
    puts '--------------'
    puts '1 2 3 4 5 6 7'
  end
end