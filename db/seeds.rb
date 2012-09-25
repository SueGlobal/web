# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Provincias
inserts = [
  'desconocida', 'Araba', 'Albacete', 'Alacant', 'Almería',
  'Ávila', 'Badajoz', 'Balears', 'Barcelona', 'Burgos',
  'Cáceres', 'Cádiz', 'Castellón de la Plana', 'Ciudad Real', 'Córdoba',
  'A Coruña', 'Cuenca', 'Girona', 'Granada', 'Guadalajara',
  'Gipuzkoa', 'Huelva', 'Huesca', 'Jaén', 'León',
  'Lleida', 'La Rioja', 'Lugo', 'Madrid', 'Málaga',
  'Murcia', 'Navarra', 'Ourense', 'Asturies', 'Palencia',
  'Las Palmas', 'Pontevedra', 'Salamanca', 'S. C. Tenerife', 'Cantabria',
  'Segovia', 'Sevilla', 'Soria', 'Tarragona', 'Teruel',
  'Toledo', 'Valencia', 'Valladolid', 'Bizkaia', 'Zamora',
  'Ceuta', 'Melilla'].each_with_index.map do |o, i|
    "(#{i}, #{x})"
 end.join(', ')

 Province.connection.execute "INSERT INTO provinces ('id_prov', 'name') VALUES #{inserts}"
