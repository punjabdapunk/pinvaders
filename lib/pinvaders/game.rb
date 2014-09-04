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
      @sp = Splash.new
      @bsc = BattleshipController.new({:vp => @vp})
      @bmc = BattlementController.new({:vp => @vp})
      @kb = Keyboard.new
    end

    def do_loop
      begin
        begin
          @kb.poll

          @vp.set_up_screen
          @bg.draw if screen_active(@kb.game_state)

          case @kb.game_state
          when :splash;
            @sp.draw;
          when :play
            @bsc.process_key(@kb.key_state)
            @bsc.draw
            @bmc.draw
          end

          @vp.move(5,5)
          @vp.draw('game_state: ' + @kb.game_state.to_s + ' key_state: ' + @kb.key_state.to_s)
          @vp.refresh if screen_active(@kb.game_state)

          sleep(1.0 / 60.0) # frames per second

          @vp.clear if screen_active(@kb.game_state)

          @kb.clear_key_state

        end until @kb.game_state == :exit
      ensure
        close_screen
      end
    end

    def screen_active(game_state)
      (@kb.game_state == :splash || @kb.game_state == :play)
    end

  end
end
