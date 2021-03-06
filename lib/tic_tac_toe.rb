class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize()
      @board = Array.new(9, " ")
  end

def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, current_player)
  @board[index.to_i - 1] = current_player
end

def position_taken?(index)
  @board[index] != " " && @board[index] != ""
end

def valid_move?(input)
  input.to_i.between?(1,9) && !position_taken?(input.to_i - 1)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(input)
      turn
  else
    move(input, current_player)
    display_board
  end
end


def turn_count
  @board.count{|value| value == "X" || value == "O"}
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |combinations|
    @board[combinations[0]] == @board[combinations[1]] && @board[combinations[0]] == @board[combinations[2]] && position_taken?(combinations[0])
  end
end
#[9,9,9,9,9,9,9,9,9,9,9,9].all?{|x| x == 9} # => true
def full?
  @board.all?{|markers| markers == "X" || markers == "O"}
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  while combinations = won?
    return @board[combinations[0]]
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end
end
