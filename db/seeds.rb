# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Provincias
if Province.count.zero?
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
    "(#{i}, '#{o}', now(), now())"
    end.join(', ')

    Province.connection.execute "INSERT INTO provinces(id_prov, name, created_at, updated_at) VALUES #{inserts}"
end

# Comunidades
if Community.count.zero?
  inserts = ['Andalucía', 'Aragón', 'Principado de Asturias', 'Baleares',
    'Canarias', 'Cantabria', 'Castilla-La Mancha', 'Castilla y León',
    'Cataluña', 'Comunidad Valenciana', 'Extremadura', 'Galicia', 'La Rioja',
    'Comunidad de Madrid', 'Navarra', 'País Vasco', 'Región de Murcia'].map do |o|
    "('#{o}', now(), now())"
  end.join(', ')


  Community.connection.execute "INSERT INTO communities(name, created_at, updated_at) VALUES #{inserts}"
end
