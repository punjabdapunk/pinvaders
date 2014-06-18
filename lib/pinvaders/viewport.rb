module Pinvaders
  class Viewport

    def initialize
      @h = Curses::lines
      @w = Curses::cols
      @win = Window.new(@h, @w, 0, 0)
      @x = 0
      @y = 0
    end

    def move(x, y)
      @x = x
      @y = y
      @win.setpos(@y, @x)
    end

    def draw(str)
      str_len = str.length

      case
      when @x < x_start && @x + str_len - 1 < x_start
        start_pos = 0
        dsp_len = 0

      when @x < x_start && @x + str_len - 1 >= x_start
        start_pos = x_start
        dsp_len = str_len - start_pos
        dsp_len = x_end if start_pos + dsp_len >= x_end

      when @x >= x_start && @x + str_len - 1 <= x_end
        start_pos = 0
        dsp_len = str_len

      when @x > x_start && @x < x_end && @x + str_len - 1 > x_end
        start_pos = 0
        dsp_len = x_end - @x + 1

      else
        start_pos = 0
        dsp_len = 0
      end

      if @y >= y_start && @y <= y_end
        @win.addstr(str[start_pos, dsp_len])
      end
    end

    def wo
      @win
    end

    def refresh
      @win.refresh
    end

    def clear
      @win.clear
    end

    def set_up_screen
      @win.box('|', '=');
      title = ' Psychidelic Invaders '
      @win.setpos(0, @w/2 - title.length/2)
      @win.addstr(title)
    end

    def height
      @h
    end

    def width
      @w
    end

    def x_start;
      1
    end

    def x_end
      @w - 2
    end

    def y_start
      1
    end

    def y_end
      @h - 2
    end

  end
end
