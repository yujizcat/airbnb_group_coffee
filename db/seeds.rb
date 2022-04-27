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

100.times do
  current_city = Faker::Address.city
  3.times do
    type = housing_type.sample
    price = 0

    case type
    when "Apartment"
      price = rand(20..150)
    when "Normal House"
      price = rand(30..200)
    when "Luxury House"
      price = rand(50..300)
    when "Shared Room"
      price = rand(10..100)
    when "Hotel"
      price = rand(40..250)
    end

    people_str = "1 person"
    people = rand(1..4)
    if people == 1
      people_str = "1 person"
    else
      people_str = "#{people} people"
    end
    discount = rand(50..99)

    Property.create!(
      name: "#{Faker::Name.first_name}'s #{Faker::Coffee.blend_name} #{type}",
      city: current_city,
      address: "#{Faker::Address.street_address}",
      description: "#{type},#{people_str},#{price},#{discount}",
      pic: "https://picsum.photos/230/130?random=#{rand(10000)}",
      user: User.first,
    )
  end
end

puts "New database created!"
