# @param {Integer} n
# @return {Integer}

def climb_stairs(n)
  cache = Hash.new(nil)
  cache[1] = 1
  cache[2] = 2

  return cache[n] if n < 3

  3.upto(n) do |num|
    cache[num] = cache[num - 1] + cache[num - 2]
  end

  cache[n]
end

test_cases = [
  [1, 1], [2, 2], [3, 3], [4, 5]
]

total = test_cases.size
failures = []
test_cases.each do |n, expected_output|
  actual = climb_stairs(n)
  if climb_stairs(n) != expected_output
    failures << "Failure: Expected #{n} to return #{expected_output}, got #{actual}"
  end
end

failures.each {|f| puts f }
puts "#{total} tests, #{failures.size} failures"
