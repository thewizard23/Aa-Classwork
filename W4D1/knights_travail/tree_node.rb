require "byebug"
class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def inspect 
        @value 
    end 

    def parent=(p_node)
        if @parent != nil
            @parent.children.delete(self)
        end 
        @parent = p_node
        if p_node != nil && !p_node.children.include?(self)
            p_node.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end 

    def remove_child(child_node)
        raise 'child is not a node' if !@children.include?(child_node)
        child_node.parent = nil
    end
   

    def dfs(target_node)
        return self if target_node == @value
        @children.each do |child_node|
         search = child_node.dfs(target_node) 
         if search
            return search
         end
        end
        return nil
    end

    def bfs(target_value)
        queue = [self] 
        while queue.length > 0
            if queue.first.value == target_value
                return queue.first
            else 
                queue += queue[0].children
                queue = queue[1..-1]
            end 
        end 
        nil
    end
    
end
