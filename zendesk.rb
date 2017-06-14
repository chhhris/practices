# SWitch Player logic

# make move
# add chip to grid
# switch player
# solicit move




# set ENVIRONMENT_VARIABLES
x, y = 6, 7


board = Board.new


class Board
  attr_accessor :rows, :column_height

  DEFAULT_NUM_ROWS = 6
  DEFAULT_COLUMN_HEIGHT = 7

  # def initialize(rows: nil, column_height: nil)
  #   @rows = rows || DEFAULT_NUM_ROWS
  #   @column_height = column_height || DEFAULT_COLUMN_HEIGHT
  # end

  def rows
    @rows ||= DEFAULT_NUM_ROWS
  end

  def column_height
    @column_height ||= DEFAULT_COLUMN_HEIGHT
  end

end

class Chip
  attr_accessor :team
end

class Cell
  attr_accessor :team
end

# start game
# take turns adding_chip
# update_game_progress

class Game
  attr_accessor :progress, :player_count

  TOTAL_PLAYERS = 2
  # DEFAULT mode is Player vs. Computer

  def initialize(single_player: true)
    # initialize progress to key (vertical chips 0): value (row number)
  end

  def status
    # in progress
    # over
  end

  def grid
    @grid ||= Array.new(x, 0)
    # OR
    # [[0, 0], [1, 0], [2, 0], [3, 0], ]
    # { 0 => 0, 0 => 1, 0 => 2, 0 => 3}
    #
  end

  def add_chip(column_num)
    if grid[column_num] < board.column_height
      grid[column_num] += 1
    end
  end

  def update_game_progres
    game_won if connect_four?
    game_over if grid_full?
  end

  def game_over_with_winner!
    # set game.status = 'won'
  end

  def game_over!
    # set game.status = 'draw'
  end

  def connect_four?
    check_horizontal
    check_vertical
    check_diagonal('ASC')
    check_diagonal('DESC')
  end

  def grid_full?
    unfilled_columns.length == 0
  end

end

game = Game.new
game.board = board

class Player
end

game = Game.new


def filled_columns
  @filled_columns ||= {}
end

def unfilled_columns
  @unfilled_columns ||= Array.new(x, true)
end
# how to unfilled_columns

# make a move
# while loop
  # pick random column => c in unfilled_columns
  #   if game.filled_columns[c]
  #     pick different column
  #   else
  #     insert chip



# Game begins
# Single player or 2 player?
# Coin Toss who goes first
#
# Player 1 move
# pick a column,
# drop chip
#
# program places chip at bottom-most available cell
# program checks for consecutive number of cells
#
# Player 2 (computer) move
# pick a column [FUNCTION]
# if first chip
#   place anywhere
# else
#   check for most strategic column [FUNCTION]
#     loop through columns, checking count of consecutive chips
#
# continue trading turns
# game is over when 4 consecutive chips
# OR
# game board is filled


# helper functions

# count adjacent chips (with every move):
#   count diagonal ASC
#   count diagonal DESC
#   count horizontal
#   count vertical
#
#   if count >= 4
#     player wins


def take_turn
  # get column number
  y = drop_chip(x)
  count = count_consecutive_chips(x, y)

  if count > 3
    game_over_with_winner!
  end
end

def drop_chip(x)
  y = 0
  while(grid[y][x].nil?) do
    y += 1
  end

  # if chip object
  # chip.coordinates = [x, y]
  # chip.save
end


def count_consecutive_chips(x, y)
  [count_horizontally(x, y), count_vertically(x, y), count_diagonally_asc(x, y), count_diagonally_desc(x, y)].max
end


# TODO ???
# create chip objects that know their coordinates
# call next chip linked list style
def count_horizontally(x, y)
  counter = 0

  previous_cell = grid[y][x -= 1]
  next_cell = grid[y][x += 1]

  while(previous_cell.team == team || next_cell.team == team) do
    counter += 1
    if previous_cell.team == team
      previous_cell = grid[y][x -= 1]
    elsif next_cell.team == team
      next_cell = grid[y][x += 1]
    else
      return counter
    end
  end
end

def count_vertically(x, y)
  counter = 0

  previous_cell = grid[y][x -= 1]
  next_cell = grid[y][x += 1]

  while(previous_cell.team == team || next_cell.team == team) do
    counter += 1
    if previous_cell.team == team
      previous_cell = grid[y][x -= 1]
    elsif next_cell.team == team
      next_cell = grid[y][x += 1]
    else
      return counter
    end
  end
end

def count_diagonally_asc(x, y)
  counter = 0

  previous_cell = grid[y -= 1][x -= 1]
  next_cell = grid[y += 1][x += 1]

  while(previous_cell.team == team || next_cell.team == team) do
    counter += 1
    if previous_cell.team == team
      previous_cell = grid[y][x -= 1]
    elsif next_cell.team == team
      next_cell = grid[y][x += 1]
    else
      return counter
    end
  end
end

def count_diagonally_desc(x, y)
  counter = 0

  previous_cell = grid[y += 1][x -= 1]
  next_cell = grid[y -= 1][x += 1]

  while(previous_cell.team == team || next_cell.team == team) do
    counter += 1
    if previous_cell.team == team
      previous_cell = grid[y][x -= 1]
    elsif next_cell.team == team
      next_cell = grid[y][x += 1]
    else
      return counter
    end
  end
end


# CHIP objects with Linked List property
def check_diagonal_asc(x, y, team)
  cell = grid[y][x]

  right_counter = 0
  while(cell.up_right == team) do
    right_counter += 1
    cell = cell.up_right
  end

  left_counter = 0
  while(cell.down_left == team) do
    left_counter += 1
    cell = cell.down_left
  end

  left_counter + right_counter
end

def check_diagonal_desc(x, y, team)
  cell = grid[y][x]

  right_counter = 0
  while(cell.down_right == team) do
    right_counter += 1
    cell = cell.down_right
  end

  left_counter = 0
  while(cell.up_left == team) do
    left_counter += 1
    cell = cell.up_left
  end

  left_counter + right_counter
end


# def count_adjacent_cells(x, y)
#   counter = 0

#   first_neighbor = grid[y][x - 1]
#   second_neighbor = grid[y][x + 1]

#   while(adjacent_cell.team == team) do
#     counter += 1
#     if adjacent_cell.team == team

#       # horizontal
#       adjacent_cell = grid[y][x + 1]
#       adjacent_cell = grid[y][x - 1]

#       # vertical
#       adjacent_cell = grid[y + 1][x]
#       adjacent_cell = grid[y - 1][x]

#       # diagonal ASC
#       adjacent_cell = grid[y + 1][x + 1]
#       adjacent_cell = grid[y - 1][x - 1]

#       # diagonal DESC
#       adjacent_cell = grid[y - 1][x + 1]
#       adjacent_cell = grid[y + 1][x - 1]
#     else
#       return counter
#     end
#   end
# end

def check_cell(x, y, counter, team)
  cell = grid[x][y]

  if cell && cell.team == team
    counter += 1
  end

  counter
end

# def check_horizontal(team)
#   return connect_four if go_left + go_right > 3
# end

# def go_left(team)
#   cell = grid[y][x - 1]

#   if cell.team == team
#     counter += 1
#   else
#   end
# end

# def go_right(team)
#   cell = grid[y][x + 1]

#   if cell.team == team
#   else
#   end
# end

cell_coordinates = [1, 4]
count_diagonal(cell_coordinates, team: 'black', direction: 'ASC')
# row #2, column #4
def count_diagonal(cell_coordinates, team:, direction:)
  next_x, next_y = cell_coordinates[0] + 1, cell_coordinates[1] + 1
  count_adjacent_cells(next_x, next_y)
end

