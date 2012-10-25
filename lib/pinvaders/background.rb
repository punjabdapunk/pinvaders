module Pinvaders
  class Background
    def initialize
      @stars = []
      1.times do |i| 
        @stars[i] = Star.new
        @stars[i].pos(1 + rand(Curses::cols), 0) 
      end
    end

    def draw
      @stars.each do |star| 
        star.draw 
        if not star.on_screen
          star.reset
          star.pos(1 + rand(Curses::cols), 0)
        end
      end
    end

    def update
      @stars.each { |star| star.scroll_y }
    end
  end
end
