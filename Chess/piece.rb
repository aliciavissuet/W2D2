require 'singleton'

class Piece
  attr_accessor :pos, :board

  def initialize(pos, board)
    # @color = color
    @board = board
    @pos = pos
  end

end

class Rook < Piece
  include SlidingPiece

  def initialize(pos, symbol, board)
    super(pos, board) 
    @symbol = symbol
  end 

  def move_dirs
    return [[0,1], [0,-1], [1,0], [-1,0]]
  end
end

class Bishop < Piece
  include SlidingPiece

  def initialize(pos, symbol, board)
    super(pos, board) 
    @symbol = symbol
  end 

  def move_dirs
    return [[1,1], [1,-1], [-1,1], [-1,-1]]
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(pos, symbol, board)
    super(pos, board) 
    @symbol = symbol
  end 

  def move_dirs
    return [[1,1], [1,-1], [-1,1], [-1,-1], [0,1], [0,-1], [1,0], [-1,0]]
  end
end

class Knight < Piece
  include SlidingPiece

  def initialize(pos, symbol, board)
    super(pos, board) 
    @symbol = symbol
  end 

  def move_dirs
    return [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]
  end
end











class NullPiece < Piece
  include Singleton
  def initialize; end
end

