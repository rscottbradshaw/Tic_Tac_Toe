require 'board'

module TicTacToe

  class Game
    attr_reader :board
    # def board
    # @board
    # end

    # attr_accessor :board
    # above and also this:
    # def board=(new_board)
    # @board = new_board
    # end

    def initialize
    end

    def start
      show_message "Welcome to Tic Tac Toe! Would you like to play a game?"
      answer = get_text
      if answer == "N"
        show_message "Oh well! It was nice meeting you!"
        exit_game
      else
        player_selection
      end
    end

    def show_message(msg)
      puts msg
    end

    def get_text
      gets.chomp
    end

    def exit_game
      exit
    end

    def display
      @board.display
    end

    def player_selection
      show_message "How many players? 0, 1, 2"
      answer = get_text
      if answer == "1"
        one_player
      elsif answer == "2"
        two_player
      else answer == "0"
        zero_player
      end
    end

    def one_player
      show_message "You have choosen to play 1 player against the unbeatable computer.  Is this correct?"
      answer = get_text
      if answer == "Y"
        letter = player_letter
        game_play(1, letter)
      else
        player_selection
      end
    end

    def two_player
      show_message "You have choosen to play 2 players.  Is this correct?"
      answer = get_text
      if answer == "Y"
        letter = player_letter
        game_play(2, letter)
      else
        player_selection
      end
    end

    def zero_player
      show_message "You have choosen to play 0 players or War Games mode.  Is this correct?"
      answer = get_text
      if answer == "Y"
        game_play(0)
      else
        player_selection
      end
    end

    def game_play(number_of_players, letter=nil)
      @board = Board.new
      display
    end

    def player_letter
      show_message "Would you like to be X or O?"
      answer = get_text
    end

  end
end
