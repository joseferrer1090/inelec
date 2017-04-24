# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sections_list = [
  [ "product", "Productos", "Seccion donde se gestionan todo lo referente a Producto" ],
  [ "services", "Servicios", "Seccion donde se gestionan todo lo referente a Servicios" ],
  [ "clients", "Clientes", "Seccion donde se gestionan todo lo referente a clientes" ],
  [ "user", "Usuarios", "Seccion donde se gestionan todo lo referente a Usuarios" ],
  [ "budget", "Presupuestos", "Seccion donde se gestionan todo lo referente a Presupuestos" ],
  [ "support", "Soportes", "Seccion donde se gestionan todo lo referente a Soporte" ]
]

users_list = [
  [ "Jonh", "Doe", "jonhdoe@inelec", "123456" ],
  [ "David", "Figueroa", "davidfigueroar9@gmail.com", "123456" ],
  [ "Erika", "De la Vega", "erikavega@gmail.com", "123456" ],
]

roles_list = [
  [ "superuser", "Super Usuario", "Role de usuario Capaz de administrar todo el sistema" ],
  [ "admin", "Administrador", "Role de usuario que tiene permisos para hacer muchas cosas en el sistema" ],
  [ "client", "Cliente de inelec", "Usuario capaz de pedir presupuestos" ]
]

sections_list.each do |slug, name, description|
  Section.create( name: name, slug: slug, description: description )
end

users_list.each do |name, last_name, email, password|
  User.create( name: name, last_name: last_name,email: email, password: password )
end

roles_list.each do |slug, name, description|
  Role.create( name: name, slug: slug, description: description )
end
role = Role.find_by(slug: 'superuser')

sections = Section.all
sections.each do |s|
  role.permissions.create!({ level: 4, section_id: s.id })
end

role = Role.find_by(slug: 'admin')

sections = Section.all
sections.each do |s|
  role.permissions.create!({ level: 3, section_id: s.id })
end

role = Role.find_by(slug: 'superuser')

user = User.find_by(name: 'David')
role = Role.find_by(slug: 'superuser')
user.roles << role

user = User.find_by(name: 'Jonh')
role = Role.find_by(slug: 'superuser')
user.roles << role

user = User.find_by(name: 'Erika')
role = Role.find_by(slug: 'client')
user.roles << role
