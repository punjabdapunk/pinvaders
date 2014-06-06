module Pinvaders
  class Star

    def initialize(vp, speed, type)
      @vp = vp
      @type = type

      case speed
      when :slow  then @brake = 6
      when :pacey then @brake = 3
      when :fast  then @brake = 1
      end

      case @type
      when :white_dwarf then @height = 1
      when :giant       then @height = 4
      when :super_giant then @height = 6
      end 

      @brush = Painter.new
      reset
    end

    def reset
      @x = 0
      @y = 0
      @lag = rand(@vp.height * 10)
      @brake_count = @brake
    end

    def pos(x, y)
      @x = x
      @y = y
    end

    def scroll_y
      @y += 1 if display?
    end

    def draw
      if display?
        case @type
        when :white_dwarf then draw_white_dwarf
        when :giant       then draw_giant
        when :super_giant then draw_super_giant
        end
      end

      if on_screen?
        @lag = (@lag > 0) ? @lag - 1 : 0
        if @lag == 0
          @brake_count = (@brake_count == 0) ? @brake : @brake_count - 1
        end
      end
    end

    def scrolled_off?
      (@y - @height + 1 > @vp.y_end)
    end

    def on_screen?(offset = 0)
      (@y + offset <= @vp.y_end)
    end

    def display?
      ((@lag == 0) and (@brake_count == 0))
    end

    private

    def draw_white_dwarf
      @vp.move(@y - 1, @x)
      @vp.draw(" ")
      if on_screen?
        @vp.move(@y, @x)
        @vp.draw("*")
        #@brush.blue { addstr("*") }
      end
    end

    def draw_giant
      if on_screen?(-3)
        setpos(@y - 3, @x)
        @brush.cyan{ addstr('_/\\_') }
      end
      if on_screen?(-2)
        setpos(@y - 2, @x) 
        @brush.cyan{ addstr('\\  /') }
      end
      if on_screen?(-1)
        setpos(@y - 1, @x)
        @brush.cyan{ addstr('/  \\') }
      end
      if on_screen?
        setpos(@y, @x)
        @brush.cyan{ addstr(' \/ ') }
      end
    end

    def draw_super_giant
      if on_screen?
        setpos(@y, @x)
        @brush.white{ addstr('   /\\   ') }
        if on_screen?(1)
          setpos(@y + 1, @x) 
          @brush.white{ addstr('__/  \\__') }
        end
        if on_screen?(2)
          setpos(@y + 2, @x)
          @brush.white{ addstr('\\      /') }
        end
        if on_screen?(3)
          setpos(@y + 3, @x)
          @brush.white{ addstr('/_    _\\') }
        end
        if on_screen?(4)
          setpos(@y + 4, @x)
          @brush.white{ addstr('  \  /  ') }
        end
        if on_screen?(5)
          setpos(@y + 5, @x)
          @brush.white{ addstr('   \/   ') }
        end
      end
    end
  end
end
