require_relative 'piece'

class Board
  attr_reader :chess_board, :sentinel

  def initialize
    @chess_board = Array.new(8) {Array.new(8)}
    @sentinel = NullPiece.instance
    fill_board
  end

  def fill_board
    @chess_board.each_index do |row|
      @chess_board.each_index do |col|
        if row == 1 || row == 6
          @chess_board[row][col] = Piece.new([row, col], :pawn, self)
        elsif row == 0
          case col
          when 0, 7
            @chess_board[row][col] = Rook.new([row, col], :rook, self)
          when 1, 6
            @chess_board[row][col] = Knight.new([row, col], :knight, self)
          when 2, 5
            @chess_board[row][col] = Bishop.new([row, col], :bishop, self)
          when 3
            @chess_board[row][col] = Queen.new([row, col], :queen, self)
          when 4
            @chess_board[row][col] = King.new([row, col], :king, self)
          end
        elsif row == 7
          case col
          when 0, 7
            @chess_board[row][col] = Rook.new([row, col], :rook, self)
          when 1, 6
            @chess_board[row][col] = Knight.new([row, col], :knight, self)
          when 2, 5
            @chess_board[row][col] = Bishop.new([row, col], :bishop, self)
          when 3
            @chess_board[row][col] = Queen.new([row, col], :queen, self)
          when 4
            @chess_board[row][col] = King.new([row, col], :king, self)
          end
        else
          @chess_board[row][col] = sentinel
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise NoPieceOnStart if self[start_pos].is_a?(NullPiece)
    raise EndPosOccupied unless self[end_pos].is_a?(NullPiece)
    target_piece = self[start_pos]  # Instance of piece
    target_piece.pos = end_pos
    self[end_pos] = target_piece
    self[start_pos] = sentinel
  end

  def [](pos)
    @chess_board[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @chess_board[pos[0]][pos[1]] = value
  end

end

class NoPieceOnStart < StandardError; end
class EndPosOccupied < StandardError; end