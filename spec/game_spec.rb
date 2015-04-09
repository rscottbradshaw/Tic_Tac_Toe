require 'spec_helper'
require 'game'

describe(Game) do
  let(:game) { Game.new }

  context "When game starts" do
    it "asks the user if they want to play a game" do
      allow(game).to receive(:get_text)
      expect(game).to receive(:show_message).with("Welcome to Tic Tac Toe! Would you like to play a game?")
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
    it "allows user to select number of players" do
      allow(game).to receive(:show_message)
      allow(game).to receive(:get_text) { "Y" }
      expect(game).to receive(:player_selection)
      game.start
    end
  end
end
