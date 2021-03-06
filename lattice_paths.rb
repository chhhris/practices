#
#  Homework IX
#
#  Problem: Lattice Paths
#
#  Prompt:  Count the number of unique paths to travel from the top left
#           corder to the bottom right corner of a lattice of N x N squares.
#
#           When moving through the lattice, one can only travel to the adjacent
#           corner on the right or down.
#
#  Input:   An integer N representing the size of the lattice
#  Output:  An integer representing the number of unique number of paths
#
#  Example: input: 2
#
#           (2 x 2 lattice of squares)
#            __ __
#           |__|__|
#           |__|__|
#
#           output: 6 (number of unique paths from top left corner to bottom right)
#
#  Notes:   What is the time and auxiliary space complexity of your solution?
#
#           Try implementing your solution using recursion with side effects.
#
#  Resource:
#             1) https://projecteuler.net/problem=15
#
#

def lattice_paths(n, i = 0, j = 0)
  return 1 if i == n && j == n
  return 0 if i > n || j > n
  return lattice_paths(n, i + 1, j) + lattice_paths(n, i, j + 1)
end

p lattice_paths(3)