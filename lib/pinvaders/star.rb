module Pinvaders
  class Star
    attr_accessor :x, :y, :on_screen, :type, :brush

    def initialize(speed, type)
      case speed
      when :slow  then @brake = 12
      when :pacey then @brake = 6
      when :fast  then @brake = 2
      end

      @type = type
      @brush = Painter.new
      reset
    end

    def reset
      @x = 0 
      @y = 0
      @lag = rand(Curses::lines * 20)
      @brake_count = @brake
    end

    def pos(x, y)
      @x = x
      @y = y
    end

    def scroll_y
      @y += 1 if display?()
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

    def on_screen?(offset = 0)
      (@y + offset < Curses::lines)
    end

    def display?
      ((@lag == 0) and (@brake_count == 0))
    end

    private

    def draw_white_dwarf
      setpos(@y - 1, @x)
      addstr(' ')
      if on_screen?
        setpos(@y, @x)
        @brush.blue { addstr("*") }
      end
    end

    def draw_giant
      setpos(@y - 1, @x)
      addstr('    ')
      setpos(@y, @x)
      addstr('    ')
      setpos(@y + 1, @x)
      addstr('    ')
      setpos(@y + 2, @x)
      addstr('    ')      
      if on_screen?
        setpos(@y, @x)
        @brush.cyan{ addstr('_/\\_') }
        if on_screen?(1)
          setpos(@y + 1, @x) 
          @brush.cyan{ addstr('\\  /') }
        end
        if on_screen?(2)
          setpos(@y + 2, @x)
          @brush.cyan{ addstr('/  \\') }
        end
        if on_screen?(3)
          setpos(@y + 3, @x)
          @brush.cyan{ addstr(' \/ ') }
        end        
      end
    end

    def draw_super_giant
      setpos(@y - 1, @x)
      addstr('        ')
      setpos(@y, @x)
      addstr('        ')
      setpos(@y + 1, @x)
      addstr('        ')
      setpos(@y + 2, @x)
      addstr('        ')
      setpos(@y + 3, @x)
      addstr('        ')
      setpos(@y + 4, @x)
      addstr('        ')                  
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
