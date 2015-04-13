require 'board'
require 'game'

module TicTacToe
  
  class Player
    attr_accessor :board

    def initialize
      @board = Board.new
    end

    def mark_cell(i)
     @board.set_cell(i, "X")
    end

    def get_user_input
      gets.chomp
    end



   #
   # def take_turn
   #   puts "|1|2|3|"
   #   puts "|4|5|6|"
   #   puts "|7|8|9|"
   #   print "Please select a postion:"
   #   location = gets.to_i - 1
   # end

   # def move_valid
   #   if

  end

end


# def take_turn
#     puts "|1|2|3|"
#     puts "|4|5|6|"
#     puts "|7|8|9|"
#     print "Please select a postion:"
#     location = get_user_input.to_i - 1
#     if @board.claimed?(location)
#       puts "That space is claimed, pick another."
#       take_turn
#     else
#       mark_square(location)
#       return @board.player_moves << (location + 9) if location < 0
#       @board.player_moves << location
#     end
#   end
