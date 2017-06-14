# INPUT arguments: width, height, number of mines
# OUTPUT printing lines width x height => integers and asterisks

# NOTES
# randomly generate mines x num_given
# calculate integers adjacent to mines (count of adjacent mines)


class Minesweeper

  # generate a board
  # randomly insert mines
  # insert integers / count

  def initialize(width, height, number_of_mines)
    @width, @height, @number_of_mines = width, height, number_of_mines
  end

  def build_board
    mines = get_mines(width, height, number_of_mines)
    load_mines_into_board
    calculate_mine_counts_per_tile
  end

  def board
    (0...@height).map do |tile|
      '0' * @width
    end
  end

  def mines
    mines = []
    generate_random_pair = lambda do |width, height|
      if mines.length == @number_of_mines
        return mines
      end

      pair = [rand(0...width), rand(0...height)]

      if mines.include?(pair)
        generate_random_pair.call(width, height)
      else
        mines << pair
      end

      generate_random_pair.call(width, height)
    end

    generate_random_pair.call(@width, @height)

    return mines
  end

  def load_mines_into_board
    mines.each do |mine|
      x, y = mine[0], mine[1]

      board[y][x] = '*'
    end
  end

  def calculate_mine_counts_per_tile
    # count number of asterisks
    y = 0
    board.each do |row|

      x = 0
      row.each do |tile|
        # check all 8 adjacent positions for each tile

        # x - 1, y
        # x - 1, y + 1
        # x - 1, y - 1

        # x + 1, y
        # x + 1, y + 1
        # x + 1, y - 1

        # x, y + 1
        # x, y - 1


        x += 1
      end

      row_num += 1
    end
  end

  # [[2, 1], [1, 3], [4, 1], [3, 1]]

  board = [
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, *, *, *, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, *, 0, 0, 0, 0, 0]
          ]

  def initialize
    board = generate_board
    generate_mines
  end

  def self.generate_board(width, height, number_of_mines)
    board = []

    (0...height).each do |tile|
      board << 'x' * width
    end

    generate_mines(board, number_of_mines)

    p board

    # fix the output
  end

  def self.generate_mines(width, height, number_of_mines)
    mines = []
    generate_random_pair = lambda do |width, height|
      if mines.length == number_of_mines
        return mines
      end

      pair = [rand(0...width), rand(0...height)]

      if mines.include?(pair)
        generate_random_pair.call(width, height)
      else
        mines << pair
      end

      generate_random_pair.call(width, height)
    end

    generate_random_pair.call(width, height)
    p mines
  end


end

Minesweeper.generate_mines(7, 4, 4)