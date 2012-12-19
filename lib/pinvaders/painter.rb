module Pinvaders
  class Painter
    def initialize
      init_pair(1,COLOR_BLACK,COLOR_BLUE)
      init_pair(2,COLOR_BLACK,COLOR_CYAN)
      init_pair(3,COLOR_BLACK,COLOR_GREEN)
      init_pair(4,COLOR_BLACK,COLOR_MAGENTA)
      init_pair(5,COLOR_BLACK,COLOR_RED)
      init_pair(6,COLOR_BLACK,COLOR_WHITE)
      init_pair(7,COLOR_BLACK,COLOR_YELLOW)
      init_pair(8,COLOR_BLACK,COLOR_BLACK)
    end

    def paint(index)
      attron(color_pair(index|Curses::A_STANDOUT)) {
        yield
      }
    end
  end
end