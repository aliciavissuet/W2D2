require 'singleton'

class Piece
  attr_writer :pos

  def initialize(pos)
    # @color = color
    # @board = board
    @pos = pos
  end

end

class Rook < Piece
  include SlidingPiece

  def initialize(pos, symbol)
    super(pos) 
    @symbol = symbol
  end 

  def move_dirs
    return [[0,1], [0,-1], [1,0], [-1,0]]
  end
end

class Bishop < Piece
  include SlidingPiece

  def initialize(pos, symbol)
    super(pos)
    @symbol = symbol
  end

  def move_dirs
    return [[1,1], [1,-1], [-1,1], [-1,-1]]
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(pos, symbol)
    super(pos)
    @symbol = symbol
  end

  def move_dirs
    return [[1,1], [1,-1], [-1,1], [-1,-1], [0,1], [0,-1], [1,0], [-1,0]]
  end
end










class NullPiece < Piece
  include Singleton
  def initialize; end
end

