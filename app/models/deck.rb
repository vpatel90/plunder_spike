class Deck < ActiveRecord::Base
  belongs_to :game
  has_many :deck_cards

  def build_deck
    Card.all.each do |card|
      self.deck_cards.build(card: card)
    end
  end

  def shuffle
    self.deck_cards.shuffle
  end
end
