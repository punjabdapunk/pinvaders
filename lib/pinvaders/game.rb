module Pinvaders
  class Game
    def initialize
      init_screen
      cbreak
      curs_set(0)
      noecho
      stdscr.keypad(true)

      @lines = Curses::lines
      @cols  = Curses::cols

      @background = Background.new
    end

    def do_loop
      begin
        loop do
          @background.draw

          @background.update
          #key = getch

          sleep(1.0 / 24.0) #24 frames per second
        end
      ensure
        close_screen
      end
    end
  end
end