require_relative "piece"


class King < Piece
    attr_reader :symbol
    def initialize(color,board,pos,symbol)
        super(color,board,pos)
        @symbol = symbol
    end
end