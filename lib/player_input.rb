module PlayerInput
  def drop_piece_prompt(current_player)
    loop do
      puts "#{current_player.name}, pick a column (1 - 7) to place your #{current_player.player_piece}."
      input = gets.chomp.to_i
      return input if (1..7).include?(input)
      raise StandardError, 'Please enter either a number between 1 and 7.' unless (1..7).include?(input)
    rescue StandardError => e
      puts e.message
      retry
    end
  end
end