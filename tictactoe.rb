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
         " #{@game_board[1][0]} | #{@game_board[1][1]} | #{@game_board[1][2]} ",
         '-----------',
         " #{@game_board[2][0]} | #{@game_board[2][1]} | #{@game_board[2][2]} "
  end

  def getting_player_move
    puts 'Choose your move from 1 to 9: '
    gets.chomp.to_i
  end

  def choose_cell(move)
    row, col = number_into_cell(move)

    if @game_board[row][col] == ' '
      @game_board[row][col] = @current_player
      switch_player
    else
      puts "Invalid move. This cell is already taken. Please try with another cell"
    end
    display_board
  end

  def number_into_cell(move)
    row = ( move - 1 ) / 3
    col = ( move - 1 ) % 3
    [row, col]
  end

  def instructions
    puts ' 1 | 2 | 3 ',
         '-----------',
         ' 4 | 5 | 6 ',
         '-----------',
         ' 7 | 8 | 9 '
  end

  def switch_player
    @current_player = "X" if @current_player == 'O'
    @current_player = "O" if @current_player == 'X'
  end
  
  


  game = Game.new
  game.display_board
  game.instructions
  move = game.getting_player_move
  game.choose_cell(move)
end
