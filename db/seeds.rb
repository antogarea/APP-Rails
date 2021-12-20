

User.create(email: 'consulta@ttps.com', password: '142536', role: :consulta)

User.create(email: 'asistencia@ttps.com', password: '142536', role: :asistencia)

User.create(email: 'administracion@ttps.com', password: '142536', role: :administracion)


Professional.create(name: 'Antonella ')
Professional.create(name: 'Valeria')
Professional.create(name: 'Carlos')


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
