module Pinvaders
  class Background
    def initialize
      @white_dwarfs = []
      @giants       = []
      @super_giants = []
      create_stars(20, @white_dwarfs, :slow, :white_dwarf)           
      create_stars(10, @giants, :pacey, :giant)           
      create_stars(5, @super_giants, :fast, :super_giant)           
    end

    def draw
      draw_stars(@white_dwarfs)
      draw_stars(@giants)
      draw_stars(@super_giants)            
    end

    def update
      @white_dwarfs.each { |star| star.scroll_y }
      @giants.each { |star| star.scroll_y }
      @super_giants.each { |star| star.scroll_y }
    end

    def refresh
      Curses::refresh
    end

    def cols
      Curses::cols
    end

    private

    def create_stars(how_many, stars, speed, size)
      how_many.times do |i|
        stars[i] = Star.new(speed, size)
        stars[i].pos(rand(Curses::cols), 0)
      end      
    end

    def draw_stars(stars)
      stars.each do |star|
        star.draw 
        if not star.on_screen?
          star.reset
          star.pos(rand(Curses::cols), 0)
        end
      end
    end
  end
end
