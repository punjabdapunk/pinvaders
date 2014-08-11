module Pinvaders
  class Battlement

    attr_accessor :x, :y

    H = 5
    W = 20

    @@hight = H
    @@width = W

    def self.height
      @@height
    end

    def self.width
      @@width
    end

    def initialize(args)
      @vp = args[:vp]
      @x = args[:x] || 0
      @y = args[:y] || 0

      @b = []
      @b[0] = '  _______________  '
      @b[1] = ' /               \ '
      @b[2] = '/                 \\'
      @b[3] = '\\                 /'
      @b[4] = ' \_______________/ '

      @brush = Painter.new(@vp)
    end

    def draw
      @vp.move(@x, @y)
      @brush.green{ @vp.draw(@b[0].to_s) }
      @vp.move(@x, @y + 1)
      @brush.green{ @vp.draw(@b[1]) }
      @vp.move(@x, @y + 2)
      @brush.green{ @vp.draw(@b[2]) }
      @vp.move(@x, @y + 3)
      @brush.green{ @vp.draw(@b[3]) }
      @vp.move(@x, @y + 4)
      @brush.green{ @vp.draw(@b[4]) }
    end

  end
end
