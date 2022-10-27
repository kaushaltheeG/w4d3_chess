require_relative "piece"


class Bishop < Piece
    include Slideable
    attr_reader :symbol
    def initialize(color,board,pos,symbol)
        super(color,board,pos)
        @symbol = symbol
    end

    private 
    def  move_dirs 
        diagonal_dirs
    end 
end