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


# Your code after this point

def movies_with_director_key(name, movies_collection)
  arr = []
  i = 0 
  
  while i < movies_collection.length do 
    arr[i] = movie_with_director_name(name, movies_collection[i])
    i += 1
  end
  arr
end


def gross_per_studio(collection)
  my_hash = {}
  i = 0 
  
  while i < collection.length do 
    film = collection[i]
    
    if !my_hash[film[:studio]]
      my_hash[film[:studio]] = film[:worldwide_gross]
    else 
      my_hash[film[:studio]] += film[:worldwide_gross]
    end
    i += 1 
  end 
    my_hash
end

def movies_with_directors_set(source)
  arr = []
  i = 0
    while i < source.length do 
      old_hash = source[i]
      d_name = old_hash[:name]
      d_movies = old_hash[:movies]
      
      arr.push(movies_with_director_key(d_name, d_movies))
      
      i += 1 
      
    end
  arr
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
