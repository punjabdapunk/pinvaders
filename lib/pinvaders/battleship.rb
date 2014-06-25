module Pinvaders
  class Battleship

  def initialize(vp)
    h = 4
    w = 9
    @vp = vp
    @x = ( @vp.x_end / 2 ) - (w / 2)
    @y = @vp.y_end - h

    @brush = Painter.new(@vp)
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
