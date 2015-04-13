require 'spec_helper'
require 'game'

module TicTacToe
  describe(Game) do
    let(:game) { Game.new }

    context "When game starts" do
      it "asks the user if they want to play a game" do
        allow(game).to receive(:get_text)
        expect(game).to receive(:show_message).with("Welcome to Tic Tac Toe! Would you like to play a game?")
        allow(game).to receive(:show_message)
        game.start
      end
    end
    context "When a user chooses to not play any more games" do
      it "thanks the user" do
        allow(game).to receive(:show_message)
        allow(game).to receive(:get_text) { "N" }
        expect(game).to receive(:show_message).with("Oh well! It was nice meeting you!")
        allow(game).to receive(:exit_game)
        game.start
      end
      it "closes the game" do
        allow(game).to receive(:show_message).twice
        allow(game).to receive(:get_text) { "N" }
        expect(game).to receive(:exit_game)
        game.start
      end
    end

    context "When a user chooses to play new game" do
      it "calls the player_selection method" do
        allow(game).to receive(:show_message)
        allow(game).to receive(:get_text) { "Y" }
        expect(game).to receive(:player_selection)
        game.start
      end
      it "shows message for player_selection" do
        allow(game).to receive(:show_message)
        allow(game).to receive(:get_text) { "Y" }
        expect(game).to receive(:show_message).with("How many players? 0, 1, 2")
        game.start
      end
      it "it allows user to play 1 player" do
        allow(game).to receive(:show_message).exactly(2).times
        allow(game).to receive(:get_text) { "1" }
        expect(game).to receive(:one_player)
        game.start
      end
      it "it allows user to play 2 player" do
        allow(game).to receive(:show_message).exactly(2).times
        allow(game).to receive(:get_text) { "2" }
        expect(game).to receive(:two_player)
        game.start
      end
      it "it allows user to play 0 player" do
        allow(game).to receive(:show_message).exactly(2).times
        allow(game).to receive(:get_text) { "0" }
        expect(game).to receive(:zero_player)
        game.start
      end
    end
  end
end
