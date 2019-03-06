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
  nickname: "albane",
  email: "albane@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/albane.jpg'
}
users_attributes << {
  nickname: "alexis",
  email: "alexis@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/alexis.jpg'
}
users_attributes << {
  nickname: "aymeric",
  email: "aymeric@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/aymeric.jpg'
}
users_attributes << {
  nickname: "ayoub",
  email: "ayoub@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/ayoub.jpg'
}
users_attributes << {
  nickname: "caroline",
  email: "caroline@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/caroline.jpg'
}
users_attributes << {
  nickname: "chloe",
  email: "chloe@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/chloe.jpg'
}
users_attributes << {
  nickname: "david",
  email: "david@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/david.jpg'
}
users_attributes << {
  nickname: "deborah",
  email: "deborah@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/deborah.jpg'
}
users_attributes << {
  nickname: "eleonore",
  email: "eleonore@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/eleonore.jpg'
}
users_attributes << {
  nickname: "emna",
  email: "emna@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/emna.jpg'
}
users_attributes << {
  nickname: "francois",
  email: "francois@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/francois.jpg'
}
users_attributes << {
  nickname: "germain",
  email: "germain@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/germain.jpg'
}
users_attributes << {
  nickname: "hugo_ple",
  email: "hugo_ple@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/hugo_ple.jpg'
}
users_attributes << {
  nickname: "hugo_raza",
  email: "hugo_raza@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/hugo_raza.jpg'
}
users_attributes << {
  nickname: "jordi",
  email: "jordi@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/jordi.jpg'
}
users_attributes << {
  nickname: "julie",
  email: "julie@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/julie.jpg'
}
users_attributes << {
  nickname: "leon",
  email: "leon@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/leon.jpg'
}
users_attributes << {
  nickname: "maxime_berger",
  email: "maxime_berger@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/maxime_berger.jpg'
}
users_attributes << {
  nickname: "maxime_legras",
  email: "maxime_legras@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/maxime_legras.jpg'
}
users_attributes << {
  nickname: "nathan",
  email: "nathan@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/nathan.jpg'
}
users_attributes << {
  nickname: "nicolas",
  email: "nicolas@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/nicolas.jpg'
}
users_attributes << {
  nickname: "nil",
  email: "nil@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/nil.jpg'
}
users_attributes << {
  nickname: "ouramdane",
  email: "ouramdane@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/ouramdane.jpg'
}
users_attributes << {
  nickname: "pedro",
  email: "pedro@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/pedro.jpg'
}
users_attributes << {
  nickname: "matthieu",
  email: "matthieu@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/matthieu.jpg'
}
users_attributes << {
  nickname: "kevin",
  email: "kevin@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/kevin.jpg'
}
users_attributes << {
  nickname: "josephb",
  email: "josephb@kickmybets.fun",
  password: "azertyuiop",
  picture_path: 'users/joseph.jpg'
}
User.create!(users_attributes)
user = User.where(nickname: "matthieu").first

puts "Creating Contests"
Contest.create!(
  {
  picture_path: 'contests/beerpong.jpg',
  title: "Beer-Pong",
  coins_init: 100,
  category: "cup",
  code: "eByTvh8ne",
  players_nb: 2,
  creator: user,
  players_attributes: [{name: "Toto"}, {name: "Titi"}]
  }
)
Contest.create!(
  {
  picture_path: 'contests/tank_race.jpg',
  title: "Tank race",
  coins_init: 100,
  category: "cup",
  code: "vVQ2R8v7m",
  players_nb: 2,
  creator: user,
  players_attributes: [{name: "Toto"}, {name: "Titi"}]
  }
)
contest = Contest.create!(
  {
  picture_path: 'contests/pingpong.jpg',
  title: "Ping-Pong",
  coins_init: 100,
  category: "cup",
  code: "zEhv8YavQ",
  players_nb: 8,
  creator: user,
  players_attributes: [{name: "eleonore"}, {name: "matthieu"}, {name: "leon"}, {name: "francois"}, {name: "david"}, {name: "aymeric"}, {name: "joseph"}]
  }
)

puts"Creating participations"
participation = Participation.create!(user: user, contest: contest, betcoins: 5)

puts "Creating Events"

