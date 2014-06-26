module Pinvaders
  class Battleship

  H = 4
  W = 9

  def initialize(vp)
    @vp = vp
    @x = ( @vp.x_end / 2 ) - (W / 2)
    @y = @vp.y_end - H

    @brush = Painter.new(@vp)
  end

  def move_left
    @x = @x - 1 < @vp.x_start ? @x : @x - 1
  end

  def move_right
    @x = @x + W > @vp.x_end ? @x : @x + 1
  end

  def draw
    @vp.move(@x, @y)
    @brush.red{ @vp.draw('    ^    ') }
    @vp.move(@x, @y + 1)
    @brush.red{ @vp.draw('   / \\   ') }
    @vp.move(@x, @y + 2)
    @brush.red{ @vp.draw(' _/\\_/\\_ ') }
    @vp.move(@x, @y + 3)
    @brush.red{ @vp.draw('<\\_\\_\\_/> ') }
  end

  end
end
