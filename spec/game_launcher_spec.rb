# frozen_string_literal: true

require_relative '../lib/game_launcher'
require_relative '../lib/play_game'

describe GameLauncher do
  describe '.start' do
    it 'initializes a new PlayGame object and starts the game' do
      play_game_instance = instance_double('PlayGame') # Mocking PlayGame to allow it to be called
      expect(PlayGame).to receive(:new).and_return(play_game_instance)
      expect(play_game_instance).to receive(:play_game)
      GameLauncher.start
    end
  end
end
