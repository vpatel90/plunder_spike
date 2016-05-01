class Game < ActiveRecord::Base
  attr_accessor :turn_index
  has_one :deck
  has_many :players
  has_one :board


  def set_initial_turn
    self.turn = rand(1..self.players.length)
    self.turn_player = self.players.find_nth(self.turn, -1).id
    self.save
  end

  def next_turn
    self.turn += 1
    if self.turn > self.players.length
      self.turn = 1
    end
    self.turn_player = self.players.find_nth(self.turn, -1).id
    self.save
  end
end
