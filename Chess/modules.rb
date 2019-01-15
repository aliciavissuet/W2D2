module SlidingPiece
  def moves
    possible_moves = []
    move_dirs.each do |dir|
      start_p = self.pos 
      col = start_pos[1]

      new_row = start_pos[0] + dir[0]
      new_col = start_pos[1] + dir[1]
      next if new_row < 0 || new_col < 0
      next if new_row > 7 || new_col > 7
      until !(self.board[new_row, new_co].is_a?(NullPiece))
        possible_moves << [new_row, new_col] 
        new_row = new_row + dir[0] 
        new_col = new_col + dir[1]
      end
    end
    return possible_moves
  end
end

