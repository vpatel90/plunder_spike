class Pirate < ActiveRecord::Base
  belongs_to :player
  belongs_to :board
  belongs_to :card
  belongs_to :merchant
end
