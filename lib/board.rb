class Board

attr_reader :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def set_cell(i, mark)
    @cells[i] = mark
  end

  def cell_claimed?(location)
    if @cells[location] == " "
      return false
    else
      return true
    end
  end

  def full?
    if @cells.include?(" ")
      return false
    else
      return true
    end
  end

  def display
   puts "--------------------"
   puts "|#{@cells[0]}|#{@cells[1]}|#{@cells[2]}|"
   puts "|#{@cells[3]}|#{@cells[4]}|#{@cells[5]}|"
   puts "|#{@cells[6]}|#{@cells[7]}|#{@cells[8]}|"
   puts "--------------------"
 end

end
#
# b = Board.new
# b.set_cell(0, "x")
# b.display
# b.set_cell(8, "o")
# b.display
