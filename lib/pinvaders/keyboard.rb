module Pinvaders
  class Keyboard

    attr_accessor :key_state, :key

    def initialize
      @key_state = :no_key
    end

    def reset
      @key_state = :no_key
    end

    def poll
      @key = getch
      set_key_state
    end

    def set_key_state
      case @key
      when KEY_MOUSE
        m = getmouse
        @key_state = :fire
      when ?Q, ?q
        @key_state = :quit
      when ?P, ?p
        @key_state = :pause
      when ?A, ?a
        @key_state = :left
      when ?D, ?d
        @key_state = :right
      else
        @key_state = :no_key
      end
    end

  end
end
