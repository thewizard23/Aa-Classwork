# For both of these problems, assume there is a Node class. The node class will take in a value as part of its initialization. You will monkeypatching the following methods:
# 1. Write a method `bfs` that does a breadth-first search starting at a root node. It takes in a target, and a proc as an argument.
# 2. Write a method `dfs` that does a depth-first search starting at a root node. It takes in a target, and a proc as an argument.
# Example usage:
# n1 = Node.new(1) # making a node with a value of 1
# n1.bfs(1) #=> n1
# n1.dfs { |node| node.value == 1 } #=> n1 (found a node with value == 1)
class Node
  # -- Assume nodes have a value, and a attr_reader on value
  # -- Also, assume there are working parent/child-related methods for Node
  attr_accessor :children, :value
    def initialize(value)
        @value = value
        @children = []
        @parent = nil
    end

    # def parent= (new_parent)
    #     parent.children.delete(self) if parent.include?(self) #delete old_parent P => a, a = [1, 2, 3, ,4], 
    #     @parent = new_parent
    #     return if new_parent == nil
    #     new_parent.children << self if !new_parent.children.include?(self)
    # end

    def bfs(&prc)
      raise "Must give a proc or target" if prc.nil?
        queue = [self]
        until queue.empty? 
          visitor = queue.shift
          return visitor if prc.call(visitor)
          queue += visitor.children
        end
        nil
    end

    [2, 3, 4, 5] << 5
    

    def dfs(target, &prc)
      raise "Must give a proc or target" if prc.nil?
      return self if prc.call(self) == true
      self.children.each do |child|
        result = child.dfs(target, &prc)
        return result if result == target
      end
    nil
    end
end

#base case 






