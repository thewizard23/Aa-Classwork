class Piece
    attr_reader :color, :board, :pos

    NAMES = ['Rook', 'Queen', 'Knight', 'King', 'Pawn', 'Bishop']

    def initialize(name, color, board, pos)
        @name = name
        @color = color 
        @board = Board.new
        @pos = pos
    end

    def valid_moves
      
    end

    def valid_name?(name)
        NAMES.include?(name)
    end


    def start_pos=(pos, name)
        row, column = pos
        @board[row][column] = name
    end

    def empty?
     @board.vaild_pos?([[pos[0], [pos[1]]])
    end


    
    

end