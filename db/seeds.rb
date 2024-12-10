require 'faker'

# Supprimer les données existantes
Booking.destroy_all
Flat.destroy_all
Guest.destroy_all
Host.destroy_all

# Créer des hôtes
puts "Creating hosts..."
5.times do
  Host.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email
  )
end
hosts = Host.all

# Créer des invités
puts "Creating guests..."
10.times do
  Guest.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email
  )
end
guests = Guest.all

# Créer des appartements
puts "Creating flats..."
20.times do
  Flat.create!(
    name: Faker::Address.street_name,
    description: Faker::Lorem.sentence(word_count: 10),
    address: Faker::Address.full_address,
    price: rand(50..300),
    max_guests: rand(1..6),
    available: [true, false].sample,
    host: hosts.sample
  )
end
flats = Flat.all

# Créer des réservations
puts "Creating bookings..."
30.times do
  flat = flats.sample
  start_date = Faker::Date.between(from: 2.days.from_now, to: 30.days.from_now)
  end_date = start_date + rand(1..7).days
  Booking.create!(
    flat: flat,
    guest: guests.sample,
    host_id: flat.host_id,
    start_date: start_date,
    end_date: end_date,
    total_price: (end_date - start_date).to_i * flat.price
  )
end

puts "Seeding completed!"
