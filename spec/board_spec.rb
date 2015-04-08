require 'byebug'
require 'spec_helper'
require 'board'

describe Board do
  let(:board) { Board.new }

  describe "initialize" do
    it "initializes the board with 9 cells" do
      expect(board.cells.size).to eq 9
    end
  end

  describe "set_cell" do
    it "sets location mark for cells" do
      board.set_cell(0, 1)
      expect(board.cells[0]).to eq 1
    end
  end

  describe "cell_claimed?" do
    it "returned false if not claimed" do
      board.set_cell(0, " ")
      expect(board.cell_claimed?(0)).to eq false
    end

    it "returned true if claimed" do
      board.set_cell(0, 1)
      expect(board.cell_claimed?(0)).to eq true
    end
  end

  describe "full?" do
    it "returned false if board has empty cells" do
      board.full?
      expect(board.full?).to eq false
    end

    it "returned true if board is full" do
      # (0..8).each{|i| board.set_cell(i, 1) }
      (0..8).each do |i|
        board.set_cell(i, 1)
      end
      expect(board.full?).to eq true
    end
  end

end
