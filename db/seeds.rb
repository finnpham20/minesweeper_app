# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

100.times do
  height = rand(3..20)
  width = rand(3..20)

  attributes = {
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    height: height,
    width: width,
    num_of_mine: (height * width * 0.2).floor
  }
  Board.create(attributes)
end
