require_relative "piece"
require_relative "slideable"

class Queen < Piece
    include Slideable
    attr_reader :symbol
    def initialize(color,board,pos,symbol)
        super(color,board,pos)
        @symbol = symbol
    end

    private 
    def  move_dirs 
        horizontal_dirs + diagonal_dirs
    end 
end