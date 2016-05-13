board = Array.new(9, " ")

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, char="X")
  board[position.to_i-1] = char
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, location)
  location.between?(0,8) && !position_taken?(board, location)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  location = input.to_i-1
  if valid_move?(board, location)
    move(board, location)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn != " "
      counter += 1
    end 
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
  position_1 = board[win_combo[0]]
  position_2 = board[win_combo[1]]
  position_3 = board[win_combo[2]]
  if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    return win_combo
  end
end
  nil 
end

def full?(board)
  board.all? do |e|
    e == 'X' || e == 'O'
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  winner = won?(board)
  if winner
    return board[winner[0]]
  end
  nil
end