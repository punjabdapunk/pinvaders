module Pinvaders
  class BattleshipController

    def initialize(vp)
      @vp = vp
      @bs = Battleship.new(@vp)
    end

    def process_key(key_state)
      case key_state
      when :left
        @bs.move_left
      when :right
        @bs.move_right
      when :fire
      end

      @bs.draw
    end
  end
end
