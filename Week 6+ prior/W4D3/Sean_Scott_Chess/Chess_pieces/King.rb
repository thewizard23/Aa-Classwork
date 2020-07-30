require_relative 'piece.rb'
require_relative 'Stepable.rb'

class King < Piece
    include Stepable

     def move_diffs
        [ [1,0], [1,1], [1,-1], [0,1], [-1,-1], [-1,1], [0,-1] ]
    end
end