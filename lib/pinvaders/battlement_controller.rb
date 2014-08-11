module Pinvaders
  class BattlementController

    attr_accessor :vp, :bs, :missiles, :missile_key

    def initialize(args)
      @vp = args[:vp]
      @b1 = Battlement.new({:vp => @vp, :x => @vp.x_start + 10, :y => 23})
      @b2 = Battlement.new({:vp => @vp, :x => 60, :y => 23})
      @b3 = Battlement.new({:vp => @vp, :x => @vp.x_end - Battlement.width - 10, :y => 23})
    end

    def draw
      @b1.draw
      @b2.draw
      @b3.draw
    end

  end
end
