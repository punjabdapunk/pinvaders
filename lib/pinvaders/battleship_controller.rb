module Pinvaders
  class BattleshipController

    attr_accessor :vp, :bs, :missiles, :missile_key

    def initialize(args)
      @vp = args[:vp]
      @bs = Battleship.new({:vp => @vp})
      @missiles = {}
      @missile_key = 0
    end

    def process_key(key_state)
      case key_state
      when :left
        @bs.move_left
      when :right
        @bs.move_right
      when :fire
        m = Missile.new({:vp => @vp})
        m.x = @bs.centre_axis
        m.y = @bs.y

        @missile_key += 1
        @missiles.merge!(@missile_key => m)
      end
    end

    def draw
      @bs.draw
      @missiles.each { |k, m|
        m.on_screen ? m.move_up : @missiles.delete(k)
        m.draw
      }
    end

  end
end
