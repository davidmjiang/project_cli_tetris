#Block needs to know about Board in order to use validate_move and hit_bottom?
class Block < DeadBlock

  def initialize(x_coord)
    super(x_coord,20)
  end

  def coordinates
    [@x, @y]
  end


  def move_left
    x -= 1 if @board.validate_move(x - 1)
  end
  
  def move_right
    x += 1 if @board.validate_move(x + 1)
  end
  # def rotate
  def quick_fall
    until @board.hit_bottom?
      fall
    end
    # fall until you hit bottom
  end
  
  def fall
    y -= 1 unless @board.hit_bottom?
  end

end
