require_relative "dead_block"
require_relative "block"
require_relative "player"
require_relative "board"

class Tetris
BOTTOM_ROW_IDX=0
TOP_ROW_IDX=19

  def initialize
    @player = Player.new
    @board = Board.new
  end

  def play
    until lose
      @board.make_new_block
      @board.render_grid
      loop do 
        move = @player.get_input
          if @board.validate_move(move)
            @board.move_block(move)
            break
          else
            puts "Invalid choice"
          end
      end
      @board.render_grid
      
      if @board.full_row?(BOTTOM_ROW_IDX)
        @board.delete_row
      end

    end
  end

  def lose
    @board.full_row?(TOP_ROW_IDX)
  end
#   def lose
# # if block is in top 4 rows after landing
#   end
end


#different class for blocks once they hit the ground
