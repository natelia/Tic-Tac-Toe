class Game
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 4], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]
  def initialize
    @game_board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
    @current_player = 'X'
  end

  def display_board
    puts " #{@game_board[0][0]} | #{@game_board[0][1]} | #{@game_board[0][2]} ",
         '-----------',
         " #{@game_board[1][1]} | #{@game_board[1][1]} | #{@game_board[1][2]} ",
         '-----------',
         " #{@game_board[2][0]} | #{@game_board[2][1]} | #{@game_board[2][2]} "
  end

  def getting_player_move
    puts 'Choose your move from 1 to 9: '
    gets.chomp.to_i
  end
  def instructions
    puts '1 | 2 | 3',
         '---------',
         '4 | 5 | 6',
         '---------',
         '7 | 8 | 9'
  end

  def switch_player
   @current_player = "X" if @current_player == "O"
   @current_player = "O" if @current_player == "X"
  end

  game = Game.new
  game.display_board
  game.instructions
  game.getting_player_move
end