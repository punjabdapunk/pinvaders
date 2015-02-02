module Pinvaders
  class Splash

    def initialize(args)
      @vp = args[:vp]
      @x = 0
      @y = 0

      @brush = Painter.new(@vp)
      @psychedelic = []
      @invaders = []

      # UC = uppercase, LC = lowercase
      @psychedelic[0] = UCP.new({:vp => @vp})
      @psychedelic[1] = LCS.new({:vp => @vp})
      @psychedelic[2] = LCY.new({:vp => @vp})
      @psychedelic[3] = LCC.new({:vp => @vp})
      @psychedelic[4] = LCH.new({:vp => @vp})
      @psychedelic[5] = LCI.new({:vp => @vp})
      @psychedelic[6] = LCD.new({:vp => @vp})
      @psychedelic[7] = LCE.new({:vp => @vp})
      @psychedelic[8] = LCL.new({:vp => @vp})
      @psychedelic[9] = LCI.new({:vp => @vp})
      @psychedelic[10] = LCC.new({:vp => @vp})
      @invaders[0] = UCI.new({:vp => @vp})
      @invaders[1] = LCN.new({:vp => @vp})
      @invaders[2] = LCV.new({:vp => @vp})
      @invaders[3] = LCA.new({:vp => @vp})
      @invaders[4] = LCD.new({:vp => @vp})
      @invaders[5] = LCE.new({:vp => @vp})
      @invaders[6] = LCR.new({:vp => @vp})
      @invaders[7] = LCS.new({:vp => @vp})

      @psychedelic_width = 0
      @psychedelic.each {|c| @psychedelic_width += c.width}
      @psychedelic_start = @vp.centre - (@psychedelic_width / 2)

      @invaders_width = 0
      @invaders.each {|c| @invaders_width += c.width}
      @invaders_start = @vp.centre - (@invaders_width / 2) + 15

      @x_scroll = 0
    end

    def draw
      @x_scroll += 1

      @psychedelic.each do |c|
        c.x = @psychedelic_start + c.width + @x_scroll
        c.y = 10
        c.draw
      end
    end
  end

  class UCP
    attr_accessor :x, :y

    def initialize(args)
      @vp = args[:vp]

      @x = 0
      @y = 0
      @brush = Painter.new(@vp)
    end

    def draw
      @vp.move(@x, @y)
      @brush.rainbow{ @vp.draw(' ______') }
      @vp.move(@x, @y + 1)
      @brush.rainbow{ @vp.draw('|   __ \\') }
      @vp.move(@x, @y + 2)
      @brush.rainbow{ @vp.draw('|    __/') }
      @vp.move(@x, @y + 3)
      @brush.rainbow{ @vp.draw('|___|') }
    end

    def height
      4
    end

    def width
      8
    end
  end

  class UCI
    attr_accessor :x, :y

    def initialize(args)
      @vp = args[:vp]

      @x = 0
      @y = 0
      @brush = Painter.new(@vp)
    end

    def draw_I(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw(' _______ ') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('|_     _|') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw(' _|   |_ ') }
      @vp.move(x, y + 3)
      @brush.rainbow{ @vp.draw('|_______|') }
    end

    def height
      4
    end

    def width
      9
    end
  end

  class LCS
    attr_accessor :x, :y

    def initialize(args)
      @vp = args[:vp]

      @x = 0
      @y = 0
      @brush = Painter.new(@vp)
    end

    def draw_s(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw('.-----.') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('|__ --|') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw('\'_____|') }
    end

    def height
      3
    end

    def width
      7
    end
  end

  class LCY
    attr_accessor :x, :y

    def initialize(args)
      @vp = args[:vp]

      @x = 0
      @y = 0
      @brush = Painter.new(@vp)
    end

    def draw_y(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw('.--.--.') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('|  |  |') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw('\'___  |') }
      @vp.move(x, y + 3)
      @brush.rainbow{ @vp.draw('|_____\'') }
    end

    def height
      4
    end

    def width
      7
    end
  end

  class LCC
    attr_accessor :x, :y

    def initialize(args)
      @vp = args[:vp]

      @x = 0
      @y = 0
      @brush = Painter.new(@vp)
    end

    def draw_c(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw('.----.') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('|  __|') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw('\'____|') }
    end

    def height
      3
    end

    def width
      6
    end
  end

  class LCH
    attr_accessor :x, :y

    def initialize
      @x = 0
      @y = 0
    end

    def draw_h(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw(' __   ') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('|  |--.') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw('|     |') }
      @vp.move(x, y + 3)
      @brush.rainbow{ @vp.draw('|__|__|') }
    end

    def height
      4
    end

    def width
      7
    end
  end

  class LCI
    attr_accessor :x, :y

    def initialize
      @x = 0
      @y = 0
    end

    def draw_i(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw(' __ ') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('|__|') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw('|  |') }
      @vp.move(x, y + 3)
      @brush.rainbow{ @vp.draw('|__|') }
    end

    def height
      4
    end

    def width
      4
    end
  end

  class LCD
    attr_accessor :x, :y

    def initialize
      @x = 0
      @y = 0
    end

    def draw_d(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw('    __ ') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('.--|  |') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw('|  _  |') }
      @vp.move(x, y + 3)
      @brush.rainbow{ @vp.draw('\'_____|') }
    end

    def height
      4
    end

    def width
      7
    end
  end

  class LCE
    attr_accessor :x, :y

    def initialize
      @x = 0
      @y = 0
    end

    def draw_e(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw('.-----.') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('|  -__|') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw('\'_____|') }
    end

    def height
      3
    end

    def width
      7
    end
  end

  class LCL
    attr_accessor :x, :y

    def initialize
      @x = 0
      @y = 0
    end

    def draw_l(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw(' __ ') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('|  |') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw('|  |') }
      @vp.move(x, y + 3)
      @brush.rainbow{ @vp.draw('|__|') }
    end

    def height
      4
    end

    def width
      4
    end
  end

  class LCN
    attr_accessor :x, :y

    def initialize
      @x = 0
      @y = 0
    end

    def draw_n(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw('.-----.') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('|     |') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw('|__|__|') }
    end

    def height
      3
    end

    def width
      7
    end
  end

  class LCV
    attr_accessor :x, :y

    def initialize
      @x = 0
      @y = 0
    end

    def draw_v(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw('.--.--.') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('|  |  |') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw(' \___/ ') }
    end

    def height
      3
    end

    def width
      7
    end
  end

  class LCA
    attr_accessor :x, :y

    def initialize
      @x = 0
      @y = 0
    end

    def draw_a(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw('.---.-.') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('|  _  |') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw('\'___._|') }
    end

    def height
      3
    end

    def width
      7
    end
  end

  class LCR
    attr_accessor :x, :y

    def initialize
      @x = 0
      @y = 0
    end

    def draw_r(x, y)
      @vp.move(x, y)
      @brush.rainbow{ @vp.draw('.----.') }
      @vp.move(x, y + 1)
      @brush.rainbow{ @vp.draw('|   _\'') }
      @vp.move(x, y + 2)
      @brush.rainbow{ @vp.draw('|__|  ') }
    end

    def height
      3
    end

    def width
      6
    end
  end

end
