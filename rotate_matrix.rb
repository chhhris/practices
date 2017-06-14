matrix = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [6, 5, 4, 2],
    [9, 5, 2, 7]
]



class RotateMatrix

  def execute(matrix)
    @x_min = 0
    @x_max = matrix[0].length - 1
    @y_min = 0
    @y_max = matrix.length - 1

    while (@x_min <= @x_max && @y_min < @y_max) do
      right(@x_min, @y_min)
      down(@x_max)
      left(@x_max, @y_max)
      up(@x_min, @y_max)
    end
  end

  def results
    @results ||= []
  end

  def right(x, y)
    matrix[y].each do |el|
      results.push(el)
    end
    @y_max -= 1
  end

  def down(x)
    matrix.each do |row|
      row[x]
    end
    @x_max -= 1
  end

  def left(x, y)

    matrix[y][x]
    @y_max -= 1
  end

  def up(x, y)
    @x_max -= 1
  end

end