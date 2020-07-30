require "byebug" 
require_relative 'tree_node.rb'
class KnightPathFinder

    attr_accessor :root_node 

    def initialize(pos)
        @starting_position = pos
        @considered_pos = [pos]
    end


    def self.valid_moves(pos)
        poss_motions = [[2, 1], [2, -1], [1,2], [1,-2], [-2, 1], [-2, -1], [-1, -2], [-1, 2]]
        poss_movs = []
        poss_motions.each do |motion|
            row = motion[0] + pos[0]
            col = motion[1] + pos[1]
            if row < 8 && row >= 0 && col < 8 && col >= 0
                poss_movs << [row, col]
            end
        end
        poss_movs 
    end 

    def new_move_positions(pos)
        positions = KnightPathFinder.valid_moves(pos)
        new_arr = []
        positions.each do |posit|
            if !@considered_pos.include?(posit)
                @considered_pos << posit
                new_arr << posit
            end
        end
        new_arr
    end


    def build_move_tree
        @root_node = PolyTreeNode.new(@starting_position)
        queue = [@root_node] 
        while queue.length > 0
            current_node = queue.shift
            current_position = current_node.value 
            self.new_move_positions(current_position).each do |position|
                child_node = PolyTreeNode.new(position)
                current_node.add_child(child_node) 
                queue << child_node
            end 
        end 
        true 
    end

    def find_path(end_pos) 
      target = @root_node.bfs(end_pos)
      self.trace_path_back(target)
    end 

    def trace_path_back(position)
        arr = []
        target_node = position 
        until target_node.parent.nil? 
            arr.unshift(target_node.parent)
            target_node = target_node.parent 
        end 
        arr
    end
end


# kpf = KnightPathFinder.new([0, 0])