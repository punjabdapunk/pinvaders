module Pinvaders
  class Background
    def initialize
      @white_dwarfs = []
      @giants       = []
      @super_giants = []
      20.times do |i|
        @white_dwarfs[i] = Star.new(:slow, :white_dwarf)
        @white_dwarfs[i].pos(rand(Curses::cols), 0)
      end
      10.times do |i|
        @giants[i] = Star.new(:pacey, :giant)
        @giants[i].pos(rand(Curses::cols), 0)
      end
      5.times do |i|
        @super_giants[i] = Star.new(:fast, :super_giant)
        @super_giants[i].pos(rand(Curses::cols), 0)
      end            
    end

    def draw
      @white_dwarfs.each do |star|
        star.draw 
        if not star.on_screen?
          star.reset
          star.pos(rand(Curses::cols), 0)
        end
      end
      @giants.each do |star|
        star.draw 
        if not star.on_screen?
          star.reset
          star.pos(rand(Curses::cols), 0)
        end
      end
      @super_giants.each do |star|
        star.draw 
        if not star.on_screen?
          star.reset
          star.pos(rand(Curses::cols), 0)
        end
      end            
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
  end
end
