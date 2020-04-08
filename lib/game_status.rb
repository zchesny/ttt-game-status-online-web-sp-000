# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First col
  [1,4,7], # Middle col
  [2,5,8], # Last col
  [0,4,8], # L->R diagonal
  [2,4,6] # L<-R diagonal
]

# won method, accepts board as argument
# returns false/nil if no win combinations present
# returns winning combination indexes as an array if there is a win
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    combo.all?{|index| position_taken?(board, index)} && (combo.all?{|index| board[index] == "X"} || combo.all?{|index| board[index] == "O"})
  end
end

# full method accepts board as argument
# returns true if every element in the board contains either "X" or "O"
def full?(board)
  board.all?{|value| (value != nil) && (value != " ")}
end

# draw method accepts board
# returns true if board has not been won and is full
# returns false if board is won
def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    return board[winning_combo.first]
  end
end
