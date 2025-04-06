# frozen_string_literal: true

# centralises start game modes
# includes #start method - used to create new PlayGame class and call play_game method
# used in main.rb to lauch game
# will include #load #play_game_computer

require_relative 'play_game'

class GameLauncher
  def self.start
    game = PlayGame.new
    game.play_game
  end
end
