module Pinvaders
  class Background
    def initialize(vp)
      @vp = vp

      @white_dwarfs = []
      @giants       = []
      @super_giants = []
      create_stars(25, @white_dwarfs, :slow, :white_dwarf)
      #create_stars(10, @giants, :pacey, :giant)
      #create_stars(5, @super_giants, :fast, :super_giant)
      #brush = Painter.new
      #brush.background
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
        stars[i].pos(rand(@vp.x_start..@vp.x_end), 0)
      end
    end

    def draw_stars(stars)
      stars.each do |star|
        star.draw
        if star.scrolled_off?
          star.reset
          star.pos(rand(@vp.x_start..@vp.x_end), 0)
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
