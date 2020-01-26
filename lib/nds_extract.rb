# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end
# transforms the data for an individual movie to include the director name

# Your code after this point ############################################

def movies_with_director_key(name, movies_collection)
  final_array1 = []
  counter1 = 0 
    while counter1 < movies_collection.length do
      current_movie = movies_collection[counter1] 
      final_array1[counter1] = movie_with_director_name(name, current_movie)
      counter1 += 1 
    end 
  final_array1
end

def gross_per_studio(collection)
  final_hash = {} 
  counter2 = 0 
    while counter2 < collection.length do 
      current_studio = collection[counter2][:studio]
      if final_hash[current_studio] == nil 
        final_hash[current_studio] = 0 
      end 
      final_hash[current_studio] += collection[counter2][:worldwide_gross]
      counter2 += 1 
    end 
  final_hash 
end

def movies_with_directors_set(source)
  final_array = [] 
  final_counter = 0 
  while final_counter < source.length do
    name = source[final_counter][:name]
    movies_collection = source[final_counter][:movies]
    add_this = movies_with_director_key(name, movies_collection) # this will give an array of movie hashes with the director name included for that director 
    final_array.push(add_this)
    final_counter += 1 
  end 
  final_array
end

# GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
