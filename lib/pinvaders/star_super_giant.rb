module Pinvaders
  class StarSuperGiant < Star

    def default_brake
      17
    end

    def default_height
      6
    end

    def default_star
     @vp.move(x, y)
     @brush.blue {@vp.draw('   /\\   ')}
     @vp.move(x, y + 1)
     @brush.blue {@vp.draw('__/  \\__')}
     @vp.move(x, y + 2)
     @brush.blue {@vp.draw('\\      /')}
     @vp.move(x, y + 3)
     @brush.blue {@vp.draw('/_    _\\')}
     @vp.move(x, y + 4)
     @brush.blue {@vp.draw('  \  /  ')}
     @vp.move(x, y + 5)
     @brush.blue {@vp.draw('   \/   ')}
    end

  end
end
