module Pinvaders
  class Game

    def initialize
      init_screen
      cbreak
      curs_set(0)
      noecho
      stdscr.keypad(true)
      stdscr.nodelay = 1

      if has_colors?
        start_color
        use_default_colors
      end

      @vp = Viewport.new
      @bg = Background.new(@vp)
      @kb = Keyboard.new
      @bs = Battleship.new(@vp)
    end

    def do_loop
      begin
        loop do
          @kb.poll

          @vp.set_up_screen
          @bg.draw
          @bs.draw

          sleep(1.0 / 60.0) # frames per second

          @vp.refresh
          @vp.clear
        end
      ensure
        close_screen
      end
    end

  end
end
