class Merchant < ActiveRecord::Base
  belongs_to :player
  belongs_to :board
  belongs_to :card
  has_many :pirates
  has_many :pirate_cards, through: :pirates, source: :card

  def set_leader
    colors = ['blue','green','purple','gold']
    leader = nil
    sum = 0
    colors.each do |color|
      cards = self.pirate_cards.where(color: color)

      unless cards.empty?
        new_sum = 0
        new_leader = pirates.find_by(card_id: cards.first.id).player.id
        cards.each do |card|
          new_sum += card.value
        end

        if new_sum > sum
          sum = new_sum
          leader = new_leader
        elsif new_sum == sum
          leader = nil
        end
      end
    end
    self.leader = leader
    self.lead_cannons = sum
    self.save
  end

end
