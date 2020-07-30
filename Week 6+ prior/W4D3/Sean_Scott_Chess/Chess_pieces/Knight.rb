require_relative 'piece.rb'
require_relative 'Stepable.rb'

class Knight < Piece
    include Stepable
    
    def move_diff
        [[2, 1], [2, -1], [1,2], [1,-2], [-2, 1], [-2, -1], [-1, -2], [-1, 2]]
    end
    
end
