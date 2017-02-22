require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |user|
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    username: Faker::Pokemon.name.downcase,
    password: 111111,
    avatar: Faker::Avatar.image,
    city: Faker::Address.city,
    country: Faker::Address.country
    )
  user.save
end

Category.new(name: 'Cat 1')
Category.new(name: 'Cat 2')
Category.new(name: 'Cat 3')
Category.new(name: 'Cat 4')
Category.new(name: 'Cat 5')

PriceRange.new(name: 'Low')
PriceRange.new(name: 'Medium')
PriceRange.new(name: 'High')

10.times do |product|
  product = Product.new(
    user_id: User.pluck(:id).sample,
    image: Faker::Placeholdit.image("50x50"),
    title: Faker::Hipster.sentence(3),
    category_id: Category.pluck(:id).sample,
    price_range_id: PriceRange.pluck(:id).sample,
    description: Faker::Hipster.sentence(8),
    )
  product.save
  5.times do |find|
    find = ProductFind.new(
      user_id: User.pluck(:id).sample,
      product_id: product.id,
      image: Faker::Placeholdit.image("50x50"),
      title: Faker::Hipster.sentence(3),
      url: 'http://google.com',
      price: 100,
      description: Faker::Hipster.sentence(8),
      )
    find.save
  end
end


