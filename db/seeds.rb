# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

6.times do
  tags = ['Car', 'Space', 'Life', 'Ship', 'Another Ship', 'Too Many Category']
  category = Category.create(name: Faker::Lorem.word)
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: 123456)
  4.times do
    category.blogs.create(title: Faker::Lorem.sentence(3), content: Faker::Lorem.sentence(50), user: user, tag_list: tags.sample(1 + rand(tags.count)))
  end 
end
