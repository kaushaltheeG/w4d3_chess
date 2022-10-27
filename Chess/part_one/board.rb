require_relative 'pieces'

class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece.instance
    end

    def fill_out_pos
       self.fill_with_pawn
       self.fill_with_knight
       self.fill_with_rook
       self.fill_with_bishop
       self.fill_with_royalty
       self.fill_null_piece
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "no piece found at this start position" if self[start_pos].nil?
        raise "end position is not empty" if !self[end_pos].nil?

        piece = self[start_pos]
        self[start_pos] = nil 
        piece.pos = end_pos
        self[end_pos] = piece
    end 

    def display
        display = Display.new(@grid)
        display.render 
    end 
    #def vaild_moves

    def fill_with_pawn
        (0...@grid[1].length).each do |i|
            @grid[1][i] = Pawn.new(:black, self, [1, i],:P)
        end

        (0...@grid[6].length).each do |i|
            @grid[6][i] = Pawn.new(:white, self, [6, i],:P)
        end
    end
    
    def fill_with_rook
        #pos [0,0] [0,7] [7,7] [7,0]
        self[[0,7]] = Rook.new(:black, self, [0, 7],:R)
        self[[0,0]] = Rook.new(:black, self, [0, 0], :R)
        self[[7,7]] = Rook.new(:white, self, [7, 7], :R)
        self[[7,0]]  = Rook.new(:white, self, [7, 0], :R)
    end

    def fill_with_knight
        self[[0, 6]] = Knight.new(:black, self, [0, 6], :Kn)
        self[[0, 1]] = Knight.new(:black, self, [0, 1], :Kn)
        self[[7, 6]] = Knight.new(:white, self, [7, 6], :Kn)
        self[[7, 1]] = Knight.new(:white, self, [7, 1], :Kn)
    end

    def fill_with_bishop
        self[[0, 2]] = Bishop.new(:black, self, [0, 2], :B)
        self[[0, 5]] = Bishop.new(:black, self, [0, 5], :B)
        self[[7, 2]] = Bishop.new(:white, self, [7, 2], :B)
        self[[7, 5]] = Bishop.new(:white, self, [7, 5], :B)
    end

    def fill_with_royalty
        self[[0, 3]] = King.new(:black, self, [0, 3],:K)
        self[[0, 4]] = Queen.new(:black, self, [0, 4],:Q)
        self[[7, 3]] = King.new(:white, self, [7, 3],:K)
        self[[7, 4]] = Queen.new(:white, self, [7, 4],:Q)
    end
    
    def fill_null_piece

        (2..5).each do |x|
            (0..7).each do |y| 
                self[[x, y]] = @null_piece
            end 
        end

    end
    

end 