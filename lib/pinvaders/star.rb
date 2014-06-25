module Pinvaders
  class Star
    attr_accessor :x, :y, :type, :speed

    def initialize(vp, speed, type)
      @speed = speed
      @type = type
      @x = 0
      @y = 0

      case speed
      when :slow  then @brake = 17
      when :pacey then @brake = 10
      when :fast  then @brake = 5
      end


      case type
      when :white_dwarf then @height = 1
      when :giant       then @height = 3
      when :super_giant then @height = 6
      end

      @brake_count = @brake
      @vp = vp
      @brush = Painter.new(@vp)
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
      case @type
      when :white_dwarf then draw_white_dwarf
      when :giant       then draw_giant
      when :super_giant then draw_super_giant
      end

      @brake_count = (@brake_count == 0) ? @brake : @brake_count - 1
    end

    def scrolled_off?
      y > @vp.y_end
    end

    private

    def draw_white_dwarf
      @vp.move(x, y)
      @brush.rainbow {@vp.draw(".")}
    end

    def draw_giant
      @vp.move(x, y)
      @brush.cyan {@vp.draw(' \\ / ')}
      @vp.move(x, y + 1)
      @brush.cyan {@vp.draw('--*--')}
      @vp.move(x, y + 2)
      @brush.cyan {@vp.draw(' / \\ ')}
    end

    def draw_super_giant
     @vp.move(x, y)
     @brush.blue {@vp.draw('   /\\   ')}
     @vp.move(x, y + 1)
     @brush.blue {@vp.draw('__/  \\__')}
     @vp.move(x, y + 2)
     @brush.blue {@vp.draw('\\      /')}
     @vp.move(x, y + 3)
     @brush.blue {@vp.draw('/_    _\\')}
     @vp.move(x, y + 4)
     @brush.blue {@vp.draw('  \  /  ')}
     @vp.move(x, y + 5)
     @brush.blue {@vp.draw('   \/   ')}
    end

  end
end
