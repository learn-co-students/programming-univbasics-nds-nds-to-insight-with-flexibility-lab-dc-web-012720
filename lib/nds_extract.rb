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
  return result
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


#--------------------------------------------------------------
#------------------------------------Your code after this point

def movies_with_director_key(name, movies_collection)
  
  #Using the movie_with_director_name method: Provide a collection of movies 
  # GOAL: For each Hash in an Array (movies_collection), provide a collection of movies 
  # AND 
  # a director's name to the movie_with_director_name method
  
  # Accumulate the returned Array of movies into a new array
  # that is returned by this method.
  
  # INPUT:
  # * name: A director's name "Steven".to_sym
  # * movies_collection: An Array of Hashes where each Hash represents a movie

  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  
  #So we are pushing hashes into an array, in which each hash represents a movie with the "director_name" key.
  
  movieArray = []
  i = 0
  while i < movies_collection.length do
    mwd = movie_with_director_name(name, movies_collection[i])
    newHashToPush = Hash.new
    newHashToPush[:director_name] = mwd[:director_name]
    movieArray.push(newHashToPush)
    i += 1
  end
  return movieArray
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT: 
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN: {studio-name: totalSum, studio-name1: totalSum, ..}
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  
  i = 0
  hashToReturn = Hash.new
  while i < collection.length do
    hashIndex = collection[i]
    
    #if our new HashMap has the key containing the current iteration's studio name
    if hashToReturn.key?(hashIndex[:studio])
      
      #gets previous accumulated value and
      #adds the current iteration's of the worldwide_gross value to the previous worldwide_gross value.
      previousValue = hashToReturn[hashIndex[:studio]]
      hashToReturn[hashIndex[:studio]] = (hashIndex[:worldwide_gross]) + previousValue
      i += 1
    
    #Goes here when there is a new studio key, initialization of new key and value.
    else 
      hashToReturn[hashIndex[:studio]] = hashIndex[:worldwide_gross]
      i+=1
    end
  end
  return hashToReturn
end


def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  
  returnArray = []
  i = 0
  while i < source.length do #currently source.length = 9
    j = 0
    while j < source[i][:movies].length do
      newHash = Hash.new
      innerArrayToPush = []
      newHash[:title] = source[i][:movies][j][:title]
      newHash[:director_name] = source[i][:name]
      if (source[i][:movies][j][:studio] && source[i][:movies][j][:worldwide_gross])
        newHash[:studio] = source[i][:movies][j][:studio]
        newHash[:worldwide_gross] = source[i][:movies][j][:worldwide_gross]
      end
      innerArrayToPush.push(newHash)
      returnArray.push(innerArrayToPush)
      j += 1
    end
    i += 1
  end
  return returnArray
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end