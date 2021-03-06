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

MovementType.destroy_all
MovementType.create(name: 'Entrada')
MovementType.create(name: 'Salida')

Article.destroy_all
Article.create(image_url: "https://www.decathlon.es/media/836/8369758/big_6aa9ddf49b2742a598f05cbd1c06afe4.jpg", code: 1213, description: 'camisa', user_id: 1)
Article.create(image_url: "http://www.bragard.es/2002-thickbox_default/koros-pantalon-negro.jpg", code: 1214, description: 'pantalon negro', user_id: 2)

Movement.destroy_all
Movement.create(movement_type_id: 3, article_id: 1, amount: 30, user_id: 1)
Movement.create(movement_type_id: 4, article_id: 1, amount: 10, user_id: 1)
Movement.create(movement_type_id: 3, article_id: 2, amount: 15, user_id: 2)