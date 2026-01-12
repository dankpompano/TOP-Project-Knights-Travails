require_relative './pair.rb'
def knight_moves(start, dest)
  result = bfs(start, dest)
  count = result.length - 1
  puts "You made it in #{count} moves!  Here's your path:"
  p result
end

def bfs(start, dest)
  queue = []
  visited = Array.new(8) { Array.new(8, false) }
  parent = {}

  dRow = [-2, -2, -1, -1, 1, 1, 2, 2]
  dCol = [-1, 1, -2, 2, -2, 2, -1, 1]

  queue << start
  visited[start[0]][start[1]] = true
  parent[start] = nil

  while !queue.empty?
    v = queue.shift
    return build_path(parent, dest) if v == dest

    x, y = v

    for i in 0...8
      adj_x = x + dRow[i]
      adj_y = y + dCol[i]

      if is_valid(visited, adj_x, adj_y)
        queue << [adj_x, adj_y]
        visited[adj_x][adj_y] = true
        parent[[adj_x, adj_y]] = v
      end
    end
  end

  []
end


def is_valid(visited, row, col)
  return false if row < 0 || row >= 8
  return false if col < 0 || col >= 8
  return false if visited[row][col]
  true
end

def build_path(parent, dest)
  path = []
  current = dest

  while current
    path << current
    current = parent[current]
  end

  path.reverse
end


p knight_moves([3,3],[4,3])