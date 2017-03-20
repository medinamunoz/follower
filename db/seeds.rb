# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Department.destroy_all
Establishment.destroy_all
City.destroy_all

cities = City.create([{name:"Copiapó"}, {name:"Vallenar"}, {name:"Huasco"}, {name:"Chañaral"}, {name:"Diego de Almagro"}]) 




establishments = Establishment.create([{name: "Hospital de Copiapó", city: cities[0]}, {name: "Dirección del Servicio de Salud", city: cities[0]}, , {name: "Hospital Provincial del Huasco, Mons. Fernando Aritía", city: cities[1]}, {name: "Hospital Manuel Magalhaes Medling", city: cities[2]}, {name: "Hospital Dr. Jerónimo Méndez Arancibia", city: cities[3]}, {name: "Hospital Florencio Vargas Díaz", city: cities[4]}])

Department.create(name: "Informática", establishment: establishments[1]) 
Department.create(name: "Finazas", establishment: establishments[1])
Department.create(name: "Jurídica", establishment: establishments[1])
Department.create(name: "Estadísticas", establishment: establishments[1])

Department.create(name: "Informática", establishment: establishments[0]) 
Department.create(name: "Finazas", establishment: establishments[0])
Department.create(name: "Jurídica", establishment: establishments[0])
Department.create(name: "Estadísticas", establishment: establishments[0])