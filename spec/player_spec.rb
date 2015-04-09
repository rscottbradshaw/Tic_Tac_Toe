require 'byebug'
require 'spec_helper'
require 'player'

describe Player do
  before do
    @player = Player.new
  end

  describe "initialize" do
    it "initializes board" do
      expect(@player.board.class).to eq Board
    end
  end

  describe "mark_cell" do
    it "will mark selected cell with an X" do
      @player.mark_cell(1)
      expect(@player.board.cells[1]).to eq "X"
    end
  end

  # describe "take_turn" do
  #   it "assigns user input to correct cell" do
  #     @player.take_turn
  #     expect(@player.take_turn.location[2]).to eq 1
  #   end
  # end
  # describe "move_valid" do
  #   it "verify user input is valid" do
  #     @player.move_valid
  #     expect(@player.board)
  # end


end
