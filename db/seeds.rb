# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.destroy_all
Player.destroy_all
Game.destroy_all
Indicator.destroy_all
Statistic.destroy_all

first_team = Team.create(name: 'Первая команда')
second_team = Team.create(name: 'Вторая команда')
players = []
5.times do |i|
  players << Player.create(name: "Игрок ##{i + 1}", team: first_team)
  players << Player.create(name: "Игрок ##{i + 1}", team: second_team)
end

first_game = Game.create(name: 'Первая игра')
second_game = Game.create(name: 'Вторая игра')
third_game = Game.create(name: 'Третья игра')

first_indicator = Indicator.create(name: 'Пробежал', measurement: 'км')
second_indicator = Indicator.create(name: 'Сделал', measurement: '% точных передач')

Statistic.create(game: first_game, player: players[0], indicator: first_indicator, value: 5)
Statistic.create(game: first_game, player: players[3], indicator: first_indicator, value: 10)
Statistic.create(game: first_game, player: players[7], indicator: first_indicator, value: 3)
Statistic.create(game: first_game, player: players[9], indicator: first_indicator, value: 20)
Statistic.create(game: second_game, player: players[0], indicator: first_indicator, value: 10)
Statistic.create(game: second_game, player: players[2], indicator: first_indicator, value: 7)
Statistic.create(game: third_game, player: players[4], indicator: second_indicator, value: 40)
Statistic.create(game: third_game, player: players[7], indicator: second_indicator, value: 30)
