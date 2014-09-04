module Pinvaders
  class Keyboard

    attr_accessor :key_state, :game_state, :key

    def initialize
      @key = ''
      @key_state = :no_key
      @game_state = :splash
    end

    def clear_key_state
      @key_state = :no_key
    end

    def poll
      @key = getch
      set_states
    end

    def set_states
      case @game_state
      when :paused
        @game_state = :play if @key == 'P' || @key == 'p'
        @key_state = :no_key

      when :play
        case @key
        when KEY_MOUSE
          m = getmouse
          @key_state = :fire
        when 'A', 'a'
          @key_state = :left
        when 'D', 'd'
          @key_state = :right
        when 'P', 'p'
          @key_state = :no_key
          @game_state = :paused
        when 'Q', 'q'
          @key_state = :quit
          @game_state = :splash
        else
          @key_state = :no_key
        end

      when :splash
        case @key
        when 'X', 'x'
          @key_state = :no_key
          @game_state = :exit
        when ' '
          @key_state = :no_key
          @game_state = :play
        end
      end
    end

  end
end
