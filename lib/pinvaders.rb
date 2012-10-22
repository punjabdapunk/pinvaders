require "pinvaders/version"
require "pinvaders/game"
require "curses"

module Pinvaders
  include Curses

  pinvaders = Game.new
  pinvaders.loop
end
