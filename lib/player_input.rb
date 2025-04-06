# frozen_string_literal: true

# contains prompts and errors for player input
# method: #drop_piece_prompt(current_player) - includes an error if input is not a number between 1 - 7 inclusive.
# method: #play_again prompt - launches game if y is selected, exits if n
# required in PlayGame class

module PlayerInput
  def drop_piece_prompt(current_player)
    loop do
      puts "#{current_player.name}, pick a column (1 - 7) to place your #{current_player.game_piece}."
      input = gets.chomp.to_i
      return input if (1..7).include?(input)
      raise StandardError, 'Please enter either a number between 1 and 7.' unless (1..7).include?(input)
    rescue StandardError => e
      puts e.message
      retry
    end
  end

  def play_again_prompt
    puts 'Do you want to play again? (y/n)'
    input = gets.chomp.downcase
    if input == 'y'
      GameLauncher.start
    else
      puts 'Thanks for playing!'
      exit
    end
  end
end
