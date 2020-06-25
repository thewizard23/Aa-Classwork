require_relative 'piece'
class Board
    
    def initialize
        @grid = Array.new(8) {Array.new(8, nil)}
        size = 64
    end
    
    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    # def valid_moves
    #     if 
    # end

   def move_piece(start_pos, end_pos)
        row, col = start_pos
        row_end, col_end = end_pos
        if self[[row,col]] == nil
            raise 'There is no piece here'
        elsif self[[row_end,col_end]] != nil
            raise 'There is a piece here already'
        else
            self[start_pos] = self[end_pos]
        end
   end

   def vaild_pos?(pos)
    pos.each do |p|
        return false if p < 0 || p > 7
    end
    return true
   end

#    def add_piece(piece, pos)
#     @grid[pos] = pieceif @grid.vaild_pos?(pos)
#    end

#    def checkmate?(color)

#    end

#    def in_check?(color)
#    end
end