# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.create ([{
  title: "Ruby",
  description: "Ruby on Rails",
  public_flag: true,
  user_name: "Thura"
},
{
  title: "PHP",
  description: "Laravel",
  public_flag: true,
  user_name: "Zar Zar"
}])