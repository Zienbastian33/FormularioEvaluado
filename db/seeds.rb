# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Crea 10 registros de pacientes
10.times do
  Paciente.create(
    rut: Faker::IDNumber.valid,
    nombres: Faker::Name.first_name,
    apellidos: Faker::Name.last_name,
    direccion: Faker::Address.street_address,
    ciudad: Faker::Address.city,
    telefono: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    fecha_nacimiento: Faker::Date.between(from: '1950-01-01', to: '2000-12-31'),
    estado_civil: ['Soltero', 'Casado'].sample,
    comentarios: Faker::Lorem.sentence
  )
end