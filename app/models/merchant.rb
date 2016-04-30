class Merchant < ActiveRecord::Base
  belongs_to :player
  belongs_to :board
  belongs_to :card
end
