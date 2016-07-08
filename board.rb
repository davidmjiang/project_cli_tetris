#10x20 view
#10x24 so the block has space to generate (extra 4 on top)

class Board
  def initialize
    @blocks=[]
    @display=Array.new(10){Array.new(20){" "}}
  end

  def make_new_block

    @block=Block.new((0..9).to_a.sample)
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

    @block.fall
  end


  def dead_blocks
    #go through @block and make an array of all the dead blocks' coordinates
    dead_arr = @blocks.select { |i| i.class == DeadBlock }
    dead_arr.map! { |a| [a.x, a.y]}
  end

  def hit_bottom?
    #delete all the blocks in @blocks and replace them with dead blocks
    # hits the bottom or a dead square
    @block.y==0 || dead_blocks.include?([@block.x, @block.y-1])
  end

  def kill_block
    if hit_bottom?
      @blocks.push(DeadBlock.new(@block.x, @block.y))
      @blocks.select! { |i| i.class == DeadBlock }
      #this should filter out the active block, leaving only deadblocks
    end
  end

  def render_grid
    @blocks.each do |b|
      @display[b.x][b.y]=:x
    end
    binding.pry
    i=19
    while i>=0
      @display.each do |column|
        print "#{column[i]}|"
      end
      puts
      i-=1
    end
  #put all the blocks in an array
  end

  def validate_move(coordinate)
    coordinate.between?(0, 9)
  end

  def delete_row
    #move everything down a row
    @display.each do |column|
      column.each_with_index do |row, idx|
        #if top row, set it equal to blanks
        #else, set it equal to row above
        if idx==19
          row=" "
        else
          row=column[idx+1]
        end
      end
    end
  end

  def full_row?(row_num)
    full = true
    @display.each do |column|
      full = false if column[row_num] == " "
    end
    full
  end

end