# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
User.create(name: 'prueba1', email: 'prueba1@prueba1.com', password: '123456', profile_id: 1)
User.create(name: 'prueba2', email: 'prueba2@prueba2.com', password: '123456', profile_id: 2)

Profile.destroy_all
Profile.create(description: 'perfil de administrador', name: 'Administrador')
Profile.create(description: 'perfil de usuario', name: 'Usuario')