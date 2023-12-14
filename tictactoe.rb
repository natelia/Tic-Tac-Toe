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

  # Returns numbers of cells which player has chosen
  def current_player_combination
    player_cells = []

    flat_board = @game_board.flatten

    flat_board.each_with_index do |cell, index|
      cell_number = index + 1

      player_cells << cell_number if cell == @current_player
    end
    puts "Player #{@current_player}'s combination: #{player_cells}"
    player_cells
    # 1. Find all players cells
    # 2. Translate them to single array of numbers (same as WIN_COMBINATIONS)(cell into number)
  end

  def game_finished?
    board_full? || check_if_win?
  end

  def display_board
    puts " #{@game_board[0][0]} | #{@game_board[0][1]} | #{@game_board[0][2]} ",
         '-----------',
         " #{@game_board[1][0]} | #{@game_board[1][1]} | #{@game_board[1][2]} ",
         '-----------',
         " #{@game_board[2][0]} | #{@game_board[2][1]} | #{@game_board[2][2]} "
    puts
  end 

  def getting_player_move
    puts 'Choose your move from 1 to 9: '
    gets.chomp.to_i
  end

  def check_if_win?
    player_cells = current_player_combination

    WIN_COMBINATIONS.include?(player_cells)

    # 1. Check if any of WIN_COMBINATIONS includes in current player combinations  (.include?)
  end

  def choose_cell(move)
    row, col = number_into_cell(move)

    if @game_board[row][col] == ' '
      @game_board[row][col] = @current_player 
      true
    else
      false
    end
  end

  def player_move
    correct_move = false
    until correct_move == true
      move = getting_player_move
      correct_move = choose_cell(move)
      puts 'Invalid move. This cell is already taken. Please try with another cell' unless correct_move
    end
    display_board
  end

  def number_into_cell(move)
    row = (move - 1) / 3
    col = (move - 1) % 3
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
    if @current_player == 'X'
      @current_player = 'O'
    else
      @current_player = 'X'
    end
  end

  def board_full?
    @game_board.all? do |row|
      row.all? { |cell| cell != ' ' }
    end
  end
 
  def start
    puts 'Have fun!'
    display_board
    instructions
    until game_finished? do 
      player_move
      switch_player

      if check_if_win?
        puts "Player #{@current_player} wins!"
        break
      end
    end
  end

end


game = Game.new
game.start

move = game.getting_player_move
game.choose_cell(move)
