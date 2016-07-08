#10x20 view
#10x24 so the block has space to generate (extra 4 on top)

class Board
  def initialize
    @blocks=[]
  end

  def make_new_block
    @block=Block.new((0..9).to_a.sample))
    @blocks << @block
  end

  def move_block(move)
    case move
    when "a"
      @block.move_left
    when "d"
      @block.move_right
    when "s"
      @block.quick_fall
    #rotate case later here
    end
  end

  def dead_blocks
    #go through @block and make an array of all the dead blocks' coordinates
  end

  def hit_bottom?
    #delete all the blocks in @blocks and replace them with dead blocks
    # hits the bottom or a dead square
    @block.y==0 || 
  end

  def kill_block
     hit_bottom?
  end

  def render_grid
    @display=Array.new(10){Array.new(20){" "}}
    @blocks.each do |b|
      @display[b.x][b.y]=:x
    end
    print @display.transpose.reverse
  #put all the blocks in an array
  end

  def validate_move(coordinate)
    coordinate.between(0..9)
  end

  def delete_row
  end

  def full_row?
  end

end