# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up database..."
Property.destroy_all
puts "Database cleaned"

housing_type = ["Apartment", "Normal House", "Luxury House", "Shared Room", "Hotel"]

30.times do
  type = housing_type.sample
  price = 0

  case type
  when "Apartment"
    price = rand(200..1500)
  when "Normal House"
    price = rand(300..2000)
  when "Luxury House"
    price = rand(500..3000)
  when "Shared Room"
    price = rand(100..1000)
  when "Hotel"
    price = rand(400..2500)
  end

  people_str = "1 person"
  people = rand(1..4)
  if people == 1
    people_str = "1 person"
  else
    people_str = "#{people} people"
  end
  discount = rand(50..99)

  airbnb = Property.create!(
    name: "#{Faker::Name.first_name}'s #{Faker::Coffee.blend_name} #{type}",
    city: "#{Faker::Address.full_address}",
    description: "#{type},#{people_str},#{price},#{discount}",
    pic: "https://picsum.photos/230/130?random=#{rand(10000)}",
    user: User.first,
  )
end

puts "New database created!"
