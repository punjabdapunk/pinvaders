module Pinvaders
  class Viewport
    def initialize
      @h = Curses::lines
      @w = Curses::cols
      @vp = Window.new(@h, @w, 0, 0)
    end

    def move(x, y)
      @vp.setpos(x, y)
    end

    def draw(str)
      @vp.addstr(str)
    end

    def refresh
      @vp.refresh
    end

    def clear
      @vp.clear
    end

    def set_up_screen
      @vp.box('|', '=');
      title = ' Psychidelic Invaders '
      @vp.setpos(0, @w/2 - title.length/2)
      @vp.addstr(title)
    end

    def height
      @h
    end

    def width
      @w
    end

    def x_start;
      2
    end

    def x_end
      @w - 1
    end

    def y_start
      2
    end

    def y_end
      @h - 1
    end
  end
end
