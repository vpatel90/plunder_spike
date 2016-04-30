class Board < ActiveRecord::Base
  belongs_to :game
  has_many :merchants
  has_many :pirates
end
