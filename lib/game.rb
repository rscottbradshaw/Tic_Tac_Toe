class Game
  def start
    show_message("Welcome to Tic Tac Toe! Would you like to play a game?")
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
  end
end
