module Pinvaders
  class Painter

    def initialize(vp)
      @vp = vp

      init_pair(1, COLOR_BLUE, COLOR_BLACK)
      init_pair(2, COLOR_CYAN, COLOR_BLACK)
      init_pair(3, COLOR_GREEN, COLOR_BLACK)
      init_pair(4, COLOR_MAGENTA, COLOR_BLACK)
      init_pair(5, COLOR_RED, COLOR_BLACK)
      init_pair(6, COLOR_WHITE, COLOR_BLACK)
      init_pair(7, COLOR_YELLOW, COLOR_BLACK)
      init_pair(8, COLOR_BLACK, COLOR_BLACK)
    end

    def blue
      @vp.wo.attron(color_pair(1|Curses::A_STANDOUT)) {
        yield
      }
    end

    def cyan
      @vp.wo.attron(color_pair(2|Curses::A_STANDOUT)) {
        yield
      }
    end

    def green
      @vp.wo.attron(color_pair(3|Curses::A_STANDOUT)) {
        yield
      }
    end

    def magenta
      @vp.wo.attron(color_pair(4|Curses::A_STANDOUT)) {
        yield
      }
    end

    def red
      @vp.wo.attron(color_pair(5|Curses::A_STANDOUT)) {
        yield
      }
    end

    def white
      @vp.wo.attron(color_pair(6|Curses::A_STANDOUT)) {
        yield
      }
    end

    def yellow
      @vp.wo.attron(color_pair(7|Curses::A_STANDOUT)) {
        yield
      }
    end

    def black
      @vp.wo.attron(color_pair(8|Curses::A_STANDOUT)) {
        yield
      }
    end

    def paint(index)
      @vp.wo.attron(color_pair(index|Curses::A_STANDOUT)) {
        yield
      }
    end

    def background
      @vp.wo.bkgd(color_pair(8|Curses::A_STANDOUT))
    end

  end
end
