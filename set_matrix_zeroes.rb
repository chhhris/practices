require 'byebug'
# Given an m x n matrix.
# If an element is 0, set its entire row and column to 0.
# Do it in-place.

# Constraints:
# m == matrix.length
# n == matrix[0].length
# 1 <= m, n <= 200
# -231 <= matrix[i][j] <= 231 - 1

def set_zeroes(matrix)
  first_col_zero = matrix[0][0]&.zero?
  first_row_zero = matrix[0][0]&.zero?

  matrix.each_with_index do |row, row_num|
    row.each_with_index do |col, col_num|
      value = row[col_num]

      if col_num.zero? && value.zero?
        first_col_zero = true
      end

      if row_num.zero? && value.zero?
        first_row_zero = true
      end

      if value.zero?
        set_flag(row_num, col_num, matrix)
      end
    end
  end

  update_rows_and_cols(matrix, first_col_zero, first_row_zero)
  matrix
end

def set_flag(row_num, col_num, matrix)
  matrix[row_num][0] = nil
  matrix[0][col_num] = nil
end

def update_rows_and_cols(matrix, first_col_zero, first_row_zero)
  # update cols
  matrix.first.each_with_index do |col, col_num|
    next if col_num.zero?
    if col.nil?
      # set whole column to zero
      matrix.each do |row|
        row[col_num] = 0
      end
    end
  end

  # update rows
  matrix.each_with_index do |row, row_num|
    next if row_num.zero?
    if row[0].nil?
      matrix[row_num] = Array.new(row.length, 0)
    end
  end

  # check first row
  if first_col_zero
    matrix.each do |row|
      row[0] = 0
    end
  end

  if first_row_zero
    matrix[0] = Array.new(matrix.first.length, 0)
  end
end

expectations = [
  [
    [[1,1,1],[1,0,1],[1,1,1]],  # input
    [[1,0,1],[0,0,0],[1,0,1]]   # expected output
  ],
  [
    [[0,1,2,0],[3,4,5,2],[1,3,1,5]], # input
    [[0,0,0,0],[0,4,5,0],[0,3,1,0]]  # expected output
  ],
  [
    [[1,0]],
    [[0,0]]
  ],
  [
    [[1,2,3,4],[5,0,7,8],[0,10,11,12],[13,14,15,0]],
    [[0,0,3,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
  ],
  [
    [[1,0,3]],
    [[0,0,0]]
  ],
  [
    [[-4,-2147483648,6,-7,0],[-8,6,-8,-6,0],[2147483647,2,-9,-6,-10]],
    [[0,0,0,0,0],[0,0,0,0,0],[2147483647,2,-9,-6,0]]
  ]
]
expectations.each do |input, expected|
  puts "input #{input}"
  actual = set_zeroes(input)
  if actual != expected
    puts "FAIL"
    p "expected #{expected}"
    p "actual #{actual}"
  else
    puts "PASS"
  end
end