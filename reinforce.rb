require 'pry-byebug'

def knight_moves(start, dest)
  result = bfs(start, dest)
  puts "You made it in #{result.length} moves!  Here's your path:"
  p result
end

def bfs(start, dest)
  visited = Array.new(8,Array.new(8, false))
  queue = []
  result = []
  queue << start
  visited[start[0]][start[1]] = true

  dRow = [-2, -2, -1, -1, 1, 1, 2, 2]
  dCol = [-1, 1, -2, 2, -2, 2, -1, 1]

  while(!queue.empty?)
    cell = queue.shift
    x = cell[0]
    y = cell[1]
    if([x, y] == dest)
      puts "I AM HERE"
      result << [x,y]
      return result
    end
    for i in 0..7
      adjx = x + dRow[i]
      adjy = y + dCol[i]
      
      if(is_valid(visited, adjx, adjy))
        visited[adjx][adjy] = true
        queue << [adjx, adjy]
        result << [adjx, adjy]
        # binding.pry
        puts result
      end
    end
  end
end

def is_valid(visited, row, col)
  if(row >= 0 && row < 8 && col >= 0 && col < 8 && !visited[row][col])
    return true
  end
  return false
end

p bfs([3,3], [4,3])
# puts knight_moves([3,3],[4,3])