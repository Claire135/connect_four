require_relative 'board'
require_relative 'player'
require_relative 'player_input'
require_relative 'game_logic'
require_relative 'board_display'

class PlayGame
  include PlayerInput
  include GameLogic
  include BoardDisplay

  def initialize
    @game_board = Board.new
    @player1 = Player.new('Player1', 'X')
    @player2 = Player.new('Player2', 'O')
    @current_player = @player1
  end

  def play_game
    welcome_ui
    play_round
    winner_ui
    # play_again_prompt
  end

  private

  def welcome_ui
    puts "\n🎉 Welcome to Connect 4! 🎉"
    puts "#{@player1.name} will play as #{@player1.game_piece}"
    puts "#{@player2.name} will play as #{@player2.game_piece}\n\n"
  end

  def play_round
    loop do
      column = drop_piece_prompt(@current_player).to_i
      @game_board.drop_piece(column, @current_player.game_piece)
      display_board(@game_board.board)
      break if winner?(@current_player.game_piece, @game_board.board)

      switch_player
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def winner_ui
    puts "#{@current_player.name} is the winner!!"
  end
end
