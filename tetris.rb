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
      
      if @board.full_row?
        @board.delete_row
      end

    end
  end
#   def lose
# # if block is in top 4 rows after landing
#   end
end


#different class for blocks once they hit the ground
