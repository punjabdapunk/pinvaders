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
          @background.refresh
          if @background.cols != @cols
            @background = nil
            @background = Background.new
            @cols = @background.cols
            clear
          end     
          #key = getch

          sleep(1.0 / 48.0) #48 frames per second
        end
      ensure
        close_screen
      end
    end
  end
end