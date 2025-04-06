# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#initialize' do
    it 'creates a 2D array of 7 columns and 6 rows' do
      expect(board.instance_variable_get(:@board)).to eq([
                                                           %w[_ _ _ _ _ _], # Column 1
                                                           %w[_ _ _ _ _ _],  # Column 2
                                                           %w[_ _ _ _ _ _],  # Column 3
                                                           %w[_ _ _ _ _ _],  # Column 4
                                                           %w[_ _ _ _ _ _],  # Column 5
                                                           %w[_ _ _ _ _ _],  # Column 6
                                                           %w[_ _ _ _ _ _]   # Column 7
                                                         ])
    end
  end

  describe '#board_full' do
    context 'when the board is full' do
      before do
        board.instance_variable_set(:@board, Array.new(7) { Array.new(6, 'X') })
      end

      it 'returns true' do
        expect(board.board_full?).to be true
      end
    end

    context 'when the board is not full' do
      before do
        board.instance_variable_set(:@board, Array.new(7) { Array.new(6, 'X') })
        board.instance_variable_get(:@board)[0][5] = '_'
      end

      it 'returns false' do
        expect(board.board_full?).to be false
      end
    end
  end
  describe '#drop_piece' do
    let(:player1) { double('Player', name: 'Player 1', game_piece: 'X') }
    let(:player2) { double('Player', name: 'Player 2', game_piece: 'O') }

    context 'when a move is valid and no pieces have been placed in the column' do
      it 'places a piece at the top of the array' do
        allow(board).to receive(:game_piece).with(player1).and_return('X')
        board.drop_piece(1, player1.game_piece)
        expect(board.board[0][0]).to eq('X')
      end
    end

    context 'when the column is partially filled' do
      it 'places the piece in the next available row' do
        board.drop_piece(2, player1.game_piece)
        board.drop_piece(2, player2.game_piece)
        board.drop_piece(2, player1.game_piece)
        expect(board.board[1][2]).to eq('X')
      end
    end

    context 'when the move is invalid' do
      it 'returns an invalid move message and does not change the board' do
        board.instance_variable_set(:@board, Array.new(7) { Array.new(6, 'X') })
        board.instance_variable_get(:@board)[0][0] = '_'
        expected_message = 'Invalid move! Column is full.'
        expect(board.drop_piece(3, player1)).to eq(expected_message)
        expect(board.board[2][0]).to eq('X')
        expect(board.board[2][1]).to eq('X')
        expect(board.board[2][2]).to eq('X')
        expect(board.board[2][3]).to eq('X')
        expect(board.board[2][4]).to eq('X')
        expect(board.board[2][5]).to eq('X')
      end
    end
  end
end
