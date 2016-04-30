class Game < ActiveRecord::Base
  has_one :deck
  has_many :players
  has_one :board
end
