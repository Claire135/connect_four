# frozen_string_literal: true

# maintains state for @name, @game_piece, @score
# Two instances of class initialised in PlayGame
# does not require input from other classes or modules

class Player
  attr_reader :name, :game_piece

  def initialize(name, game_piece)
    @name = name
    @game_piece = game_piece
  end
end
