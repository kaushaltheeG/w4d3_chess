require_relative "piece"

class Pawn < Piece

    attr_reader :symbol

    def initialize(color,board,pos,symbol)
        super(color,board,pos)
        @symbol = symbol
    end


    def moves 
        side_attacks << forward_steps 
    end 

    private 


    def at_start_row?
        (pos[0] == 1 && color == :black) || (pos[0] == 6 && color == :white)
    end 

    def forward_dir
        
        if color == :black
            return 1
        else
            return -1
        end 

    end 

    def valid_move?(pos)
        x = pos[0]
        y = pos[1]

        (x >= 0 && x < 8) && (y >= 0 && y < 8)
    end

    def forward_steps
    
        x = pos[0]
        y = pos[1]

        if at_start_row? 
            if pos[0] == 1
                new_pos = [x + 2, y]
            elsif pos[0] == 6
                new_pos = [x - 2, y]
            end
        else 
            step = forward_dir
            new_pos = [x + step, y]
        end

        return new_pos if valid_move?(new_pos) && board[pos].color.nil?
    
        return []
    end 

    def side_attacks 
        attacks = []

        # black x always + 1  right (1, 1) left (1, -1)
        # white x always - 1  right (-1,-1) left (-1, 1)
        x = pos[0]
        y = pos[1]

        if color == :black 
            right = [x + 1, y + 1]
            left = [x + 1, y - 1]
        
            attacks << right if board[right].color != color 
            attacks << left if board[left].color != color 

        else
            right = [x - 1, y - 1]
            left = [x - 1, y + 1]
        
            attacks << right if board[right].color != color 
            attacks << left if board[left].color != color 
        end


        attacks 
    end 

end 