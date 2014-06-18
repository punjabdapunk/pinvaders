module Pinvaders
  class Background

    def initialize(vp)
      @vp = vp

      @white_dwarfs = []
      @giants       = []
      @super_giants = []
      create_stars(25, @white_dwarfs, :slow, :white_dwarf)
      create_stars(5, @giants, :pacey, :giant)
      create_stars(2, @super_giants, :fast, :super_giant)
    end

    def draw
      draw_stars(@white_dwarfs)
      draw_stars(@giants)
      draw_stars(@super_giants)
      update
    end

    private

    def create_stars(how_many, stars, speed, size)
      how_many.times do |i|
        stars[i] = Star.new(@vp, speed, size)
        stars[i].pos(rand_xpos, rand_ypos)
      end
    end

    def rand_xpos
      rand(@vp.x_start..@vp.x_end)
    end

    def rand_ypos
      rand(@vp.height * 2) * -1
    end

    def draw_stars(stars)
      stars.each do |star|
        star.draw
        if star.scrolled_off?
          star.pos(rand_xpos, rand_ypos)
        end
      end
    end

    def update
      @white_dwarfs.each { |star| star.scroll_y }
      @giants.each { |star| star.scroll_y }
      @super_giants.each { |star| star.scroll_y }
    end

  end
end
