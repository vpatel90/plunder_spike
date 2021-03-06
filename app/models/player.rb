class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  has_one :board, through: :game, source: :board
  has_many :hand_cards
  has_many :cards, through: :hand_cards, source: :card
  has_many :merchants
  has_many :merchant_cards, through: :merchants, source: :card
  has_many :pirates
  has_many :pirate_cards, through: :pirates, source: :card


  def get_hand
    self.cards.each do |card|
      puts "Player: #{User.find(self.user_id).name} | Card: #{card.category} - #{card.color} - #{card.value}"
    end
  end

  def current_game
    Game.find(self.game_id)
  end

  def draw
    g = current_game
    card = g.deck.deck_cards.sample
    self.hand_cards.create(card_id: card.card_id)
    g.deck.deck_cards.delete(card.id)
    # g.deck.deck_cards.find(draw.id).destroy
    g.deck.save
  end

  def play(card_id, target_id = 0)
    card = get_card(card_id)
    merc = Merchant.find(target_id) unless target_id == 0
    hand_card = get_hand_card(card_id)
    if card.category == 'M'
      self.merchants.create(board_id: 1, card_id: card_id, leader: self.id, lead_cannons: 0)
    elsif card.category == 'P'
      if valid_color?(card, merc)
        self.pirates.create(board_id: 1, merchant_id: target_id, card_id: card_id)
        merc.set_leader
      else
        return
      end
    end
    self.cards.delete(card_id)
    hand_card.destroy
  end

  def valid_color?(card, merc)
    find_card = merc.pirate_cards.where(color: card.color).first
    return true if find_card.nil?
    return true if merc.pirates.where(card_id: find_card.id).player == self
    return false
  end

  def get_card(id)
    Card.find(id)
  end

  def get_hand_card(id)
    HandCard.find_by(card_id: id)
  end
end
