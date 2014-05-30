# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

permisos = [
  ['users', 'index', 'usi', 'Lista de usuarios'],
  ['users', 'edit', 'B3A', 'Eliminar usuario'],
  ['profiles', 'new', '7B7', 'Crear un perfil'],
  ['profiles', 'edit', '353', 'Editar un perfil'],
  ['profiles', 'destroy', 'EE5', 'Eliminar un perfil existente'],
  ['profiles', 'index', '50E', 'Lista de perfiles generados'],
  ['people', 'index', '044', 'Lista de datos personales'],
  ['people', 'new', '84C', 'Crear una nueva identidad'],
  ['people', 'edit', 'BC9', 'Editar una identidad'],
  ['people', 'destroy', 'C7D', 'Eliminar una identidad'],
  ['person_types', 'index', '5C4', 'Lista tipos de identidades'],
  ['person_types', 'new', '965', 'Crear un nuevo tipo de identidad'],
  ['person_types', 'edit', 'CFC', 'Editar un tipo de identidad existente'],
  ['person_types', 'destroy', 'BE7', 'Eliminar un tipo de identidad existente'],
  ['places', 'index', '3B6', 'Lista de lugares aprobados'],
  ['places', 'new', 'F73', 'Crear un nueva ubicacion para eventos'],
  ['places', 'edit', '293', 'Editar una ubicacion para eventos'],
  ['places', 'destroy', '4EF', 'Eliminar una ubicacon para eventos'],
  ['event_types', 'index', 'CE7', 'Lista de tipos de eventos'],
  ['event_types', 'new', '57D', 'Crear un nuevo tipo de evento'],
  ['event_types', 'edit', '5FD', 'Editar un tipo de evento exstente'],
  ['event_types', 'destroy', 'EA3', 'Eliminar un tipo de evento existente'],
  ['participant_types', 'index', 'CB6', 'Lista de tipos de participantes'],
  ['participant_types', 'new', 'ABB', 'Crear un nuevo tipo de participante'],
  ['participant_types', 'edit', '0DF', 'Editar un tipo de particiapnte existente'],
  ['participant_types', 'destroy', 'A2E', 'Eliminar un tipo de participante existente'],
  ['events', 'index', '02E', 'Lista de eventos'],
  ['events', 'new', 'E83', 'Crear un nuevo evento'],
  ['events', 'edit', 'A76', 'Editar un evento existente'],
  ['events', 'show', 'E4D', 'Ver un evento existente'],
  ['users', 'new', 'B1C', 'Crear nuevo usuario']
]
permisos.each do |controlador, accion, tag, desc|
  Permission.create(action: accion, controller: controlador, key: tag, description: desc)
end

PersonType.create(category: 'Aplicacion', public: false, role: 'Admin')
Person.create(academic_degree: 'Admin' , biography: 'Blank', last_name: 'Admin', membership: 'PISIS', name: 'Admin', person_type_id: 1, second_last_name: 'Admin')
Profile.create(name: 'Admin', permissions: 'usi|B3A|7B7|353|EE5|50E|044|84C|BC9|C7D|5C4|965|CFC|BE7|3B6|F73|293|4EF|CE7|57D|5FD|EA3|CB6|ABB|0DF|A2E|02E|E83|A76|E4D|B1C')
User.create(username: 'Admin', password: 'admin', email: 'info@pisis.edu.mx', person_id: 1, profile_id: 1)
ParticipantType.create(name: 'Propietario', type_access: 'r-w', pd_type_id: '1')
