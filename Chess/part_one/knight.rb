require_relative "piece"

class Knight < Piece
    attr_reader :symbol
    def initialize(color,board,pos,symbol)
        super(color,board,pos)
        @symbol = symbol
    end
end 