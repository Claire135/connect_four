# frozen_string_literal: true

require_relative '../lib/game_logic'

describe GameLogic do
  subject { Class.new { include GameLogic }.new }

  describe 'winner?' do
    let(:player1) { double('Player', name: 'player1', game_piece: 'X') }
    let(:player2) { double('Player', name: 'player2', game_piece: 'O') }

    context 'when player1 (X) wins' do
      it 'returns true for 4 diagonal' do
        board = [
          %w[_ _ _ _ _ _],  # Column 1
          %w[_ X _ _ _ _],  # Column 2
          %w[_ O X _ _ _],  # Column 3
          %w[_ O O X _ _],  # Column 4
          %w[_ X O X X _],  # Column 5
          %w[_ X O X X _],  # Column 6
          %w[_ O X O O _]   # Column 7
        ]
        expect(subject.winner?(player1.game_piece, board)).to be true
      end
    end

    context 'when player2 (O) wins' do
      it 'returns true for 4 horizontal' do
        board = [
          %w[_ _ _ _ _ _],  # Column 1
          %w[_ X _ _ _ _],  # Column 2
          %w[_ O X _ _ _],  # Column 3
          %w[_ O O O O _],  # Column 4
          %w[_ X O X X _],  # Column 5
          %w[_ X O X X _],  # Column 6
          %w[_ O X O O _]   # Column 7
        ]
        expect(subject.winner?(player2.game_piece, board)).to be true
      end
    end

    context 'when player1 (X) wins' do
      it 'returns true for 4 vertical' do
        board = [
          %w[_ _ _ _ _ _],  # Column 1
          %w[_ X _ _ _ _],  # Column 2
          %w[_ O X _ _ _],  # Column 3
          %w[_ O X X O _],  # Column 4
          %w[_ X O X X _],  # Column 5
          %w[_ X O X X _],  # Column 6
          %w[_ O X X O _]   # Column 7
        ]
        expect(subject.winner?(player1.game_piece, board)).to be true
      end
    end

    context 'no player has won' do
      it 'returns false' do
        board = [
          %w[_ _ _ _ _ _],  # Column 1
          %w[_ _ _ _ _ _],  # Column 2
          %w[_ _ X _ _ _],  # Column 3
          %w[_ X X X O _],  # Column 4
          %w[_ X O X X _],  # Column 5
          %w[_ X O O X _],  # Column 6
          %w[_ O X X O _]   # Column 7
        ]
        expect(subject.winner?(player1.game_piece, board)).to be false
      end
    end
  end
end
