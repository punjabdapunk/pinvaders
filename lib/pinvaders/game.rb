module Pinvaders
  class Game

    def initialize
      init_screen
      cbreak
      curs_set(0)
      noecho
      stdscr.keypad(true)
      stdscr.nodelay = 1
      mouseinterval(1)
      mousemask(BUTTON1_CLICKED)

      if has_colors?
        start_color
        use_default_colors
      end

      @vp = Viewport.new
      @bg = Background.new({:vp => @vp})
      @bsc = BattleshipController.new({:vp => @vp})
      @bmc = BattlementController.new({:vp => @vp})
      @kb = Keyboard.new
    end

    def do_loop
      begin
        loop do
          @kb.poll
          @vp.set_up_screen

          @bg.draw

          @bsc.process_key(@kb.key_state)
          @bsc.draw

          @bmc.draw

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
