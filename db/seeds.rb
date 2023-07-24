# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Esteban, el admin (solo se crea si no existe)
User.find_or_create_by!(
  name: "Esteban",
  email: "esteban@mail.com"
) do |user|
  user.password = "Admin123" # Establecer una contraseña temporal para el administrador
  user.password_confirmation = "Admin123"
  user.is_admin = true
end

#Usuarios normales
5.times do
    User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "User123", # Establecer una contraseña temporal para los usuarios normales
      password_confirmation: "User123"
    )
  end

#Ofertas laborales
10.times do
  JobOffer.create!(
    title: Faker::Job.title,
    description: Faker::Lorem.paragraph
  )
end
