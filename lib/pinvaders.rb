require "pinvaders/version"
require "pinvaders/game"
require "pinvaders/background"
require "pinvaders/star"
require "pinvaders/star_giant"
require "pinvaders/star_super_giant"
require "pinvaders/star_white_dwarf"
require "pinvaders/painter"
require "pinvaders/version"
require "pinvaders/viewport"
require "pinvaders/keyboard"
require "pinvaders/battleship_controller"
require "pinvaders/battleship"
require "pinvaders/battlement_controller"
require "pinvaders/battlement"
require "pinvaders/missile"
require "curses"

include Curses

module Pinvaders
  pinvaders = Game.new
  pinvaders.do_loop
end
