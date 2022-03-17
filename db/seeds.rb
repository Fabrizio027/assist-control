# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "fabrizio@gmail.com", password: "123456", full_name:"Fabrizio Monteza")
User.create(email: "richard@gmail.com", password: "123456", full_name:"Richard Ortega")
User.create(email: "julio@gmail.com", password: "123456", full_name:"Julio Chinchay")
User.create(email: "nicole@gmail.com", password: "123456", full_name:"Nicole Fuentes")
User.create(email: "axel@gmail.com", password: "123456", full_name:"Axel Chavez")
User.create(email: "yender@gmail.com", password: "123456", full_name:"Yender Pantoja")
Tag.create(user_id: 1, name:"Admin", active: true)
Tag.create(user_id: 2, name:"Empleado", active: true)
Tag.create(user_id: 3, name:"Empleado", active: true)
Tag.create(user_id: 4, name:"Empleado", active: true)
Tag.create(user_id: 5, name:"Empleado", active: true)
Tag.create(user_id: 6, name:"Empleado", active: true)