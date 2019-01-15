require_relative "cursor"
require 'colorize'

class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    display_board = []
    c_row = @cursor.cursor_pos[0]
    c_col = @cursor.cursor_pos[1]
    @board.chess_board.each_with_index do |row, i|
      display_row = ""
      row.each_with_index do |piece, j|
        temp_realp = "♙ "
        temp_nullp = "_ "
        if piece.is_a?(NullPiece)
          i == c_row && j == c_col ? display_row += temp_nullp.colorize(:red) : display_row += temp_nullp
        else
          i == c_row && j == c_col ? display_row += temp_realp.colorize(:red) : display_row += temp_realp
        end
      end
      display_board << display_row
      puts display_row
    end
    return nil
  end

  #new method
   "|                    |"
    # puts"--------------------------------"
    # puts display_row
    # if i == cursor_row && j == cursor_col
    #   display_row += temp_piece.colorize(:red)
    # else
    #   display_row += temp_piece
    # end
    # temp_real_piece = "♙ | "
    # if i == cursor_row && j == cursor_col
    #   display_row += temp_real_piece.colorize(:red)
    # else
    #   display_row += temp_real_piece
    # end

  #get input
  #until input == 




end