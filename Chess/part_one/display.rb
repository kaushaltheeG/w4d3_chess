require_relative "board"
require_relative "cursor"

require 'colorize' #- Extends String class
require 'colorized_string' #- add ColorizedString class

class Display 

    attr_reader :board, :cursor
    def initialize(board)
        @board = board 
        @cursor = Cursor.new([0,0], @board)
    end 

    def render 
        @board.each do |row|
            puts "#{row[0].symbol} #{row[1].symbol} #{row[2].symbol} #{row[3].symbol} #{row[4].symbol} #{row[5].symbol} #{row[6].symbol} #{row[7].symbol}"
        end 
        nil 
    end 

end 