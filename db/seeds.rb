# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(
#   email: 'test@test.com',
#   name: 'テスト太郎',
#   password: '111111',
#   created_at: '2020-04-30 12:00:01.139093',
#   updated_at: '2020-04-30 12:00:01.139093'
# )

20.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}",
    password: "password",
    created_at: '2020-04-30 12:00:01.139093',
    updated_at: '2020-04-30 12:00:01.139093'
  )
end
