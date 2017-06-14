# scratch

down = x + 1
while(map_matrix[down] && map_matrix[down][y] == 'W') do
   if visited[[down, y]].nil?
      queue.push([down, y])
      map_matrix[down][y] = 'O'
      visited[[down, y]] = true
   end

   down += 1
end

# check up
up = x - 1
while(map_matrix[up] && map_matrix[up][y] == 'W') do
   if visited[[up, y]].nil?
      queue.push([up, y])
      map_matrix[up][y] = 'O'
      visited[[up, y]] = true
   end

   up -= 1
end

# check left
left = y - 1
while(map_matrix[x][left] && map_matrix[x][left] == 'W') do
   if visited[[x, left]].nil?
      queue.push([x, left])
      map_matrix[x][left] = 'O'
      visited[[x, left]] = true
   end

   left -= 1
end

# check right
right = y + 1
while(map_matrix[x][right] && map_matrix[x][right] == 'W') do
   if visited[[x, right]].nil?
      queue.push([x, right])
      map_matrix[x][right] = 'O'
      visited[[x, right]] = true
   end

   right += 1
end