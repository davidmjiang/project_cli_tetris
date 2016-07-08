require_relative "dead_block"
require_relative "block"
require_relative "player"
require_relative "board"

class Tetris
  def initialize
    @player = Player.new
    @board = Board.new
  end

  def play
    until lose
      @player.get_input
      @board.render_grid
    end
  end
#   def lose
# # if block is in top 4 rows after landing
#   end
end


#different class for blocks once they hit the ground
