module Pinvaders
  class Star
    attr_accessor :x, :y

    def initialize(args={})
      @vp = args[:vp]
      @brake = default_brake
      @height = default_height
      @x = 0
      @y = 0

      @brake_count = @brake
      @brush = Painter.new(@vp)
    end

    def default_brake
      1
    end

    def default_height
      1
    end

    def default_star
      @vp.move(x, y)
      @brush.rainbow {@vp.draw(".")}
    end

    def reset
      x = 0
      y = 0
      @brake_count = @brake
    end

    def pos(x, y)
      @x = x
      @y = y
    end

    def scroll_y
      @y += 1 if @brake_count == 0
    end

    def draw
      default_star
      @brake_count = (@brake_count == 0) ? @brake : @brake_count - 1
    end

    def scrolled_off?
      y > @vp.y_end
    end

  end
end
