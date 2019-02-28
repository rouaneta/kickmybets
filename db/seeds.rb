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
  password: "azertyuiop"
}
User.create!(users_attributes)
user = User.first

puts "Creating Contests"
contest = Contest.create!(
  {
  title: "contest",
  coins_init: 100,
  category: "cup",
  code: "azertyuiop",
  players_nb: 8,
  creator: user
  }
)

puts "Creating players"
player1 = Player.create!(
  contest: contest,
  name: "toto1"
)
player2 = Player.create!(
  contest: contest,
  name: "toto2"
)
player3 = Player.create!(
  contest: contest,
  name: "toto3"
)

puts "Creating games"
game1 = Game.create!(
  player_one: player1,
  player_two: player2,
  contest: contest
)
game2 = Game.create!(
  player_one: player1,
  player_two: player3,
  contest: contest
)

puts"Creating participations"
participation = Participation.create!(user: user, contest: contest, amount: 5)

puts "Creating Events"
event = Event.create!(
  contest: contest,
  user: user,
  title: "event_incroyable",
  choice_one: "gagne",
  choice_two: "perdu"
  )

puts "Creating Bets"
bet1 = Bet.create!(
  resource: event,
  participation: participation,
  amount: 4,
  choice: 1
  )
bet2 = Bet.create!(
 resource: game1,
 participation: participation,
  amount: 5,
 choice: 2
)
