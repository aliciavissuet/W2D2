require 'singleton'

class Piece
  attr_accessor :pos, :board, :symbol

  def initialize(pos, symbol, board)
    # @color = color
    @symbol = symbol
    @board = board
    @pos = pos
  end

end

class Rook < Piece
  include SlidingPiece
  def move_dirs
    return [[0,1], [0,-1], [1,0], [-1,0]]
  end
end

class Bishop < Piece
  include SlidingPiece
  def move_dirs
    return [[1,1], [1,-1], [-1,1], [-1,-1]]
  end
end

class Queen < Piece
  include SlidingPiece
  def move_dirs
    return [[1,1], [1,-1], [-1,1], [-1,-1], [0,1], [0,-1], [1,0], [-1,0]]
  end
end

class Knight < Piece
  include SteppingPiece
  def move_dirs
    return [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]
  end
end

class King < Piece
  include SteppingPiece
  def move_dirs
    return [[1,0], [-1,0], [0,1], [0,-1], [1,1], [1,-1], [-1,1], [-1,-1]]
  end
end









class NullPiece < Piece
  include Singleton
  def initialize; end
end

