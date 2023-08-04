# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

regular_user = Usuario.find_by(rol: 0)
admin_user = Usuario.find_by(rol: 1)

# regular_user = Usuario.create!(
#     email: Faker::Internet.email,
#     password: 'password',
#     nombre: Faker::Name.name,
#     telefono: Faker::PhoneNumber.phone_number,
#     rol: 0 
# )
  

# admin_user = Usuario.create!(
#     email: Faker::Internet.email,
#     password: 'password',
#     nombre: Faker::Name.name,
#     telefono: Faker::PhoneNumber.phone_number,
#     rol: 1 
# )

mascotas_usuario_regular = []

# Crea 40 mascotas para el usuario regular
40.times do
  mascotas_usuario_regular << Mascota.create!(
    nombre: Faker::Creature::Dog.name,
    apodo: [true, false].sample,
    tipo: Faker::Creature::Animal.name,
    descripcion: Faker::Lorem.sentence,
    ciudad: Faker::Address.city,
    fecha: Faker::Date.between(from: 1.year.ago, to: Date.today),
    cualidad: [Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence],
    usuario: regular_user
  )
end

# Crea otras 40 mascotas para el usuario admin
40.times do
  Mascota.create!(
    nombre: Faker::Creature::Dog.name,
    apodo: [true, false].sample,
    tipo: Faker::Creature::Animal.name,
    descripcion: Faker::Lorem.sentence,
    ciudad: Faker::Address.city,
    fecha: Faker::Date.between(from: 1.year.ago, to: Date.today),
    cualidad: [Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence],
    usuario: admin_user
  )
end