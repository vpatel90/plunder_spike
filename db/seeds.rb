# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### Merchant Cards ###
5.times do
  Card.create(type:'M', value: 2, color: 'white')
  Card.create(type:'M', value: 4, color: 'white')
  Card.create(type:'M', value: 5, color: 'white')
end

6.times do
  Card.create(type:'M', value: 3, color: 'white')
end

2.times do
  Card.create(type:'M', value: 6, color: 'white')
end

Card.create(type:'M', value: 7, color: 'white')
Card.create(type:'M', value: 8, color: 'white')
Card.create(type:'A', color: 'white')

### Pirate Cards ###
colors = ['blue','green','purple','gold']

colors.each do |color|
  Card.create(type:'C', color: color)
  2.times do
    Card.create(type:'P', value: 1, color: color)
    Card.create(type:'P', value: 4, color: color)
  end
  4.times do
    Card.create(type:'P', value: 2, color: color)
    Card.create(type:'P', value: 3, color: color)
  end
end
