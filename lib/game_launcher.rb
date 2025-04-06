require_relative 'play_game'

class GameLauncher
  def self.start
    game = PlayGame.new
    game.play_game
  end
end
