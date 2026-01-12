require_relative './pair.rb'
def knight_moves(start, dest)

end

def bfs(start, dest)
  board = [8][8]
  queue = []
  visited = []
  result = []

  dRow = [-1, 0, 1, 0]
  dCol = [0, 1, 0, -1]

  queue.push(start)
  visited.push(start)
  while(!queue.empty?)
    
  end

end

def is_valid(visited, row, col)
  arg = [row, col]
  if(row < 7 && row >= 0 && col < 7 && col >= 0 && !visited.include?(arg))
    return true
  end
  return false
end
