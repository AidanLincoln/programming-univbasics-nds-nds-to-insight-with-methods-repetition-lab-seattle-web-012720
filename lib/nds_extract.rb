$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  array_of_directors = []
  director_index = 0
  while director_index < source.length do
    array_of_directors.push(source[director_index][:name])
    director_index += 1
  end
  return array_of_directors
end

def total_gross(source)
  total = 0
  profits = directors_totals(source) 
  director_list = list_of_directors(source)
  director_index = 0
  while director_index < director_list.length do
    total += profits[director_list[director_index]]
    director_index += 1
  end
  return total
end


