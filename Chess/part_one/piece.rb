

class Piece 
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color #symbol
        @board = board #board instance 
        @pos = pos #arr
    end 

end 