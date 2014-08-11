module Pinvaders
  class Background

    def initialize(args)
      @vp = args[:vp]

      @white_dwarfs = []
      @giants       = []
      @super_giants = []

      build_stars(50, @white_dwarfs, StarWhiteDwarf)
      build_stars(5, @giants, StarGiant)
      build_stars(2, @super_giants, StarSuperGiant)
    end

    def draw
      draw_stars(@white_dwarfs)
      draw_stars(@giants)
      draw_stars(@super_giants)
      update
    end

    private

    def build_stars(how_many, stars, star_class)
      how_many.times do |i|
        stars[i] = star_class.new({:vp => @vp})
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
