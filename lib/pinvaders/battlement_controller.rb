module Pinvaders
  class BattlementController

    attr_accessor :vp, :bs, :missiles, :missile_key

    def initialize(args)
      @vp = args[:vp]
      @b1 = Battlement.new({ :vp => @vp,
                             :x  => @vp.x_start + 15,
                             :y  => @vp.height - Battleship.height - Battlement.height - 4
                           })
      @b2 = Battlement.new({ :vp => @vp,
                             :x  => (@vp.width - Battlement.width) / 2,
                             :y  => @vp.height - Battleship.height - Battlement.height - 4
                           })
      @b3 = Battlement.new({ :vp => @vp,
                             :x  => @vp.x_end - Battlement.width - 15,
                             :y  => @vp.height - Battleship.height - Battlement.height - 4
                           })
    end

    def draw
      @b1.draw
      @b2.draw
      @b3.draw
    end

  end
end
