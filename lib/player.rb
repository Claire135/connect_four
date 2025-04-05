# maintains state for @name, @game_piece, @score
# does not require input from other classes

class Player
  attr_reader :name, :game_piece, :score
  
  def initialize(name, game_piece)
    @name = name
    @game_piece = game_piece
  end
end