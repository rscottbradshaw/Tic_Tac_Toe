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
      # it "shows message for player_selection" do
      #   allow(game).to receive(:show_message)
      #   allow(game).to receive(:get_text) { "Y" }
      #   expect(game).to receive(:show_message).with("How many players? 0, 1, 2")
      #   game.start
      # end
      it "allows user to select 1 player" do
        allow(game).to receive(:show_message).exactly(2).times
        allow(game).to receive(:get_text) { "1" }
        expect(game).to receive(:one_player)
        game.start
      end
      it "allows user to select 2 player" do
        allow(game).to receive(:show_message).exactly(2).times
        allow(game).to receive(:get_text) { "2" }
        expect(game).to receive(:two_player)
        game.start
      end
      it "allows user to select 0 player" do
        allow(game).to receive(:show_message).exactly(2).times
        allow(game).to receive(:get_text) { "0" }
        expect(game).to receive(:zero_player)
        game.start
      end
    end

    describe "one_player" do
      # it "shows message confirming 1 player selected" do
      #   allow(game).to receive(:get_text) { "Y" }
      #   allow(game).to receive(:player_letter) { "X" }
      #   expect(game).to receive(:show_message).with("You have choosen to play 1 player against the unbeatable computer.  Is this correct?")
      #   game.one_player
      # end
      it "calls player_letter if the player responds yes" do
        allow(game).to receive(:get_text) { "Y" }
        expect(game).to receive(:player_letter)
        game.one_player
      end
      it "calls game_play if the player responds yes" do
        allow(game).to receive(:get_text) { "Y" }
        allow(game).to receive(:player_letter) { "X" }
        expect(game).to receive(:game_play).with(1, "X")
        game.one_player
      end
      it "returns to player selection if the answer is no" do
        allow(game).to receive(:get_text) { "N" }
        expect(game).to receive(:player_selection)
        game.one_player
      end
      it "restarts one_player if answer is invalid" do
        allow(game).to receive(:get_text) { "6" }
        expect(game).to receive(:player_selection)
        game.one_player
      end
    end

    describe "two_player" do
      it "calls player_letter if the player responds yes" do
        allow(game).to receive(:get_text) { "Y" }
        expect(game).to receive(:player_letter)
        game.two_player
      end
      it "calls game_play if the player responds yes" do
        allow(game).to receive(:get_text) { "Y" }
        allow(game).to receive(:player_letter) { "O" }
        expect(game).to receive(:game_play).with(2, "O")
        game.two_player
      end
      it "returns to player selection if the answer is no" do
        allow(game).to receive(:get_text) { "N" }
        expect(game).to receive(:player_selection)
        game.two_player
      end
      it "restarts one_player if answer is invalid" do
        allow(game).to receive(:get_text) { "p" }
        expect(game).to receive(:player_selection)
        game.two_player
      end
    end

    describe "zero_player" do
      it "calls game_play if the player responds yes" do
        allow(game).to receive(:get_text) { "Y" }
        expect(game).to receive(:game_play)
        game.zero_player
      end
      it "returns to player selection if the answer is no" do
        allow(game).to receive(:get_text) { "N" }
        expect(game).to receive(:player_selection)
        game.zero_player
      end
      it "restarts one_player if answer is invalid" do
        allow(game).to receive(:get_text) { "p" }
        expect(game).to receive(:player_selection)
        game.zero_player
      end
    end

    describe "game_play" do
      it "creates new board" do
        expect(game.board).to be_nil
        game.game_play(1, "X")
        expect(game.board).to be_a(Board)
        # below is same code in block form
        # expect { game.game_play(1, "X") }.
        # to change { game.board }.
        # from(nil).to(Board)
      end
      it "displays the new board" do
        game.game_play(1, "X")
        expect(game.display).to eq @board.display
      end
    end

    # context "When a user selects number of players" do
    #   it "shows message confirming 1 player selected" do
    #     allow(game).to receive(:show_message).exactly(3).times
    #     allow(game).to receive(:get_text) { "1" }
    #     expect(game).to receive(:show_message).with("You have choosen to play 1 player against the unbeatable computer.  Is this correct?")
    #     game.start
    #   end
    #   it "shows message confirming 2 players selected" do
    #     allow(game).to receive(:show_message).exactly(3).times
    #     allow(game).to receive(:get_text) { "2" }
    #     expect(game).to receive(:show_message).with("You have choosen to play 2 players.  Is this correct?")
    #     game.start
    #   end
    #   it "shows message confirming 0 players selected" do
    #     allow(game).to receive(:show_message).exactly(3).times
    #     allow(game).to receive(:get_text) { "0" }
    #     expect(game).to receive(:show_message).with("You have choosen to play 0 players or War Games mode.  Is this correct?")
    #     game.start
    #   end
    #
    #
    #   it "proceeds to game play for 1 player if answer is yes" do
    #     allow(game).to receive(:show_message).exactly(4).times
    #     allow(game).to receive(:get_text).and_return("Y","1","Y")
    #     expect(game).to receive(:show_message).with("Would you like to be X or O?")
    #     game.start
    #   end
      # it "proceeds to game play for 2 players if answer is yes" do
      #   allow(game).to receive(:show_message).exactly(4).times
      #   allow(game).to receive(:get_text).and_return("Y","2","Y")
      #   expect(game).to receive(:show_message).with("Would you like to be X or O?")
      #   game.start
      # end
      # it "proceeds to game play for 0 players if answer is yes" do
      #   allow(game).to receive(:show_message).exactly(4).times
      #   allow(game).to receive(:get_text).and_return("Y","0","Y")
      #   expect(game).to receive(:show_message).with("Would you like to be X or O?")
      #   game.start
      # end
      # it "returns to player selection if answer is no to 1 player game" do
      #   allow(game).to receive(:show_message).exactly(3).times
      #   allow(game).to receive(:get_text).and_return("Y","1","N")
      #   expect(game).to receive(:player_selection).twice
      #   game.start
      # end
    # end


      # it "confirms players and proceeds to correct game" do
      #   allow(game).to receive(:show_message).exactly(2).times
      #   allow(game).to receive(:get_text) { "Y" }
      #   expect(game).to receive(:game_play)
      #   game.start
      # end
    # end
  end
end
