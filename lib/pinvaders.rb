require "pinvaders/version"
require "pinvaders/game"
require "pinvaders/background"
require "pinvaders/star"
require "curses"

include Curses

module Pinvaders
  pinvaders = Game.new
  pinvaders.do_loop
end
