module Pinvaders
  class Star
    attr_accessor :x, :y, :on_screen

    def initialize
      @brake = 2
      reset
    end

    def pos(x, y)
      @x = x
      @y = y
    end

    def scroll_y
      @y += 1 if (@lag < 1) and (@brake_count == 0)
    end

    def draw
      @on_screen = @y <= Curses::lines + 2

      if (@lag < 1) and (@brake_count == 0) and @on_screen
        setpos(@y - 1, @x)
        addstr(' ')
        setpos(@y, @x)
        addstr('*')
        refresh 
      end

      if @on_screen
        @brake_count = (@brake_count == 0) ? @brake : @brake_count - 1
        @lag = (@lag > 0) ? @lag - 1 : 0
      end
    end

    def reset
      @x = 0 
      @y = 0
      @lag = 1 + rand(Curses::lines)
      @brake_count = @brake
      @on_screen = @y <= Curses::lines + 2
    end
  end
end
