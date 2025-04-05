require_relative '../lib/player_input'

describe PlayerInput do
  subject { Class.new { include PlayerInput}.new }

  let(:player1) { double('Player', name: 'player1', player_piece: 'X') }

  context 'when a character other than a number between 1 and 7 inclusive is entered' do
    it 'displays an error and keeps asking until valid input is given' do
      allow(subject).to receive(:gets).and_return("abc\n", "15\n", "3\n")

      expect(subject.drop_piece_prompt(player1)).to eq(3)
    end
  end
end