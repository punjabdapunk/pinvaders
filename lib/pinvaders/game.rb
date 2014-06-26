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
      @bc = BattleshipController.new(@vp)
      @kb = Keyboard.new
    end

    def do_loop
      begin
        loop do
          @kb.poll
          @vp.move(30, 1)
          @vp.draw(@kb.key.to_s)

          @vp.set_up_screen
          @bg.draw
          @bc.process_key(@kb.key_state)

          sleep(1.0 / 60.0) # frames per second

          @vp.refresh
          @vp.clear
          @kb.reset
        end
      ensure
        close_screen
      end
    end

  end
end
