module TicTacToe

  class Game
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
      show_message "one player"
    end

    def two_player
      show_message "two player"
    end

    def zero_player
      show_message "zero player"
    end

  end
end
