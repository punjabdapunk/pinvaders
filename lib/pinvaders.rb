require "pinvaders/version"
require "pinvaders/game"
require "pinvaders/background"
require "pinvaders/star"
require "pinvaders/painter"
require "pinvaders/version"
require "pinvaders/viewport"
require "pinvaders/keyboard"
require "pinvaders/battleship_controller"
require "pinvaders/battleship"
require "curses"

include Curses

module Pinvaders
  pinvaders = Game.new
  pinvaders.do_loop
end
