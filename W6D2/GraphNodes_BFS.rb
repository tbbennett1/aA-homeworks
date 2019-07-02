require "set"

class GraphNode
  attr_reader :val, :neighbors

  def initialize(val)
    @val = val
    @neighbors = []
  end

  def neighbors=(arr)
    @neighbors += arr
  end

  def inspect
    @val.inspect
  end

  def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = Set.new()
    
    until queue.empty?
      current_node = queue.shift
      
      unless visited.include?(current_node)
        return current_node.val if current_node.val == target_value
        visited.add(current_node)
        queue += current_node.neighbors
      end
    end
    
    return nil
  end
  
end


a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
p a.neighbors = [b, c, e]
p c.neighbors = [b, d]
p e.neighbors = [a]
p f.neighbors = [e]
p a.bfs(a, "b")
p a.bfs(a, "f")
p f.bfs(f, "a")