require_relative 'piece.rb'
require_relative 'Slideable.rb'

class Bishop < Piece 
    include Slideable

    def moves(pos)
        movs = []
        move_dirs.each do |dirs|
            row = dirs[0] + pos[0]
            col = dirs[1] + pos[1]
            if row < 8 && row >= 0 && col < 8 && col >= 0
                movs << [row, col]
            end
        end
        movs 
    end 

    def move_dirs
        diagonal_dirs
    end

end