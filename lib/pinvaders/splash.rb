module Pinvaders
  class Splash

    def initialize(args)
      @vp = args[:vp]
      @x = 0
      @y = 0

      @brush = Painter.new(@vp)
    end

    def draw
      @vp.move(5, 5)
      @brush.rainbow{ @vp.draw(' ______') }
      @vp.move(5, 6)
      @brush.rainbow{ @vp.draw('|   __ \\') }
      @vp.move(5, 7)
      @brush.rainbow{ @vp.draw('|    __/') }
      @vp.move(5, 8)
      @brush.rainbow{ @vp.draw('|___|') }

      @vp.move(13, 6)
      @brush.rainbow{ @vp.draw('.-----.') }
      @vp.move(13, 7)
      @brush.rainbow{ @vp.draw('|__ --|') }
      @vp.move(13, 8)
      @brush.rainbow{ @vp.draw('|_____|') }

      @vp.move(20, 6)
      @brush.rainbow{ @vp.draw('.--.--.') }
      @vp.move(20, 7)
      @brush.rainbow{ @vp.draw('|  |  |') }
      @vp.move(20, 8)
      @brush.rainbow{ @vp.draw('|___  |') }
      @vp.move(20, 9)
      @brush.rainbow{ @vp.draw('|_____|') }

      @vp.move(27, 6)
      @brush.rainbow{ @vp.draw('.----.') }
      @vp.move(27, 7)
      @brush.rainbow{ @vp.draw('|  __|') }
      @vp.move(27, 8)
      @brush.rainbow{ @vp.draw('|____|') }
    end
##
# ______                      __     __     __         __  __
#|   __ \.-----..--.--..----.|  |--.|__|.--|  |.-----.|  ||__|.----.
#|    __/|__ --||  |  ||  __||     ||  ||  _  ||  -__||  ||  ||  __|
#|___|   |_____||___  ||____||__|__||__||_____||_____||__||__||____|
#               |_____|
# _______                          __
#|_     _|.-----..--.--..---.-..--|  |.-----..----..-----.
# _|   |_ |     ||  |  ||  _  ||  _  ||  -__||   _||__ --|
#|_______||__|__| \___/ |___._||_____||_____||__|  |_____|
#

  end
end
