# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


4. times do
  User.create(name: Faker::Internet.user_name)
end
### Merchant Cards ###
5.times do
  Card.create(category: 'M', value: 2, color: 'white')
  Card.create(category: 'M', value: 4, color: 'white')
  Card.create(category: 'M', value: 5, color: 'white')
end

6.times do
  Card.create(category: 'M', value: 3, color: 'white')
end

2.times do
  Card.create(category: 'M', value: 6, color: 'white')
end

Card.create(category: 'M', value: 7, color: 'white')
Card.create(category: 'M', value: 8, color: 'white')
# Card.create(category: 'A', color: 'white')

### Pirate Cards ###
colors = ['blue','green','purple','gold']

colors.each do |color|
  # Card.create(category: 'C', color: color)
  2.times do
    Card.create(category: 'P', value: 1, color: color)
    Card.create(category: 'P', value: 4, color: color)
  end
  4.times do
    Card.create(category: 'P', value: 2, color: color)
    Card.create(category: 'P', value: 3, color: color)
  end
end

g = Game.create(num_players: 4)
Board.create(game_id: g.id)
Deck.create(game_id: g.id)
User.all.each do |user|
  Player.create(user_id: user.id, game_id: g.id)
end

g.deck.build_deck
g.deck.save

### Deal Cards ###
g.players.each do |player|
  6.times do
    draw = g.deck.deck_cards.sample
    player.hand_cards.create(card_id: draw.card_id)
    g.deck.deck_cards.delete(draw.id)
    # g.deck.deck_cards.find(draw.id).destroy
    g.deck.save
  end
end
