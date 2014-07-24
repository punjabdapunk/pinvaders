module Pinvaders
  class Missile

    attr_accessor :x, :y

    H = 1
    W = 1

    def initialize(vp)
      @vp = vp
      @x = 0
      @y = 0

      @brush = Painter.new(@vp)
    end

    def move_up
      @y -= 1;
    end

    def on_screen
      (@y - H) > @vp.y_start
    end

    def draw
      @vp.move(@x, @y)
      @brush.red{ @vp.draw('^') }
    end

  end
end
