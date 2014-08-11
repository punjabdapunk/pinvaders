module Pinvaders
  class StarGiant < Star

    def default_brake
      10
    end

    def default_height
      3
    end

    def default_star
      @vp.move(x, y)
      @brush.cyan {@vp.draw(' \\ / ')}
      @vp.move(x, y + 1)
      @brush.cyan {@vp.draw('--*--')}
      @vp.move(x, y + 2)
      @brush.cyan {@vp.draw(' / \\ ')}
    end

  end
end
