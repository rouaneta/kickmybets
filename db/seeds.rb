# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Emptying database"
User.destroy_all

puts "Creating Users"
users_attributes = []
users_attributes << {
  nickname: "toto",
  email: "toto@mail.com",
  password: "azertyuiop",
  picture_path: 'toto.jpg'
}
User.create!(users_attributes)
user = User.first

puts "Creating Contests"
contest = Contest.create!(
  {
  picture_path: 'contest.jpg',
  title: "contest",
  coins_init: 100,
  category: "cup",
  code: "azertyuiop",
  players_nb: 8,
  creator: user,
  players_attributes: [{name: "a"}, {name: "z"}, {name: "e"}, {name: "r"}, {name: "t"}, {name: "y"}, {name: "u"}, {name: "i"}]
  }
)

puts"Creating participations"
participation = Participation.create!(user: user, contest: contest, betcoins: 5)

puts "Creating Events"
event = Event.create!(
  participation: participation,
  title: "event_incroyable",
  choice_one: "gagne",
  choice_two: "perdu"
  )

puts "Creating Bets"
bet1 = Bet.create!(
  resource: event,
  participation: participation,
  comment: 'this guy sucks',
  amount: 4,
  choice: 1
  )
bet2 = Bet.create!(
  resource: Game.last,
  participation: participation,
  comment: 'I bet all my life on you',
  amount: 5,
  choice: 2
)
