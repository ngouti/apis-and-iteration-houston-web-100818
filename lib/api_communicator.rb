require 'rest-client'
require 'json'
require 'pry'



def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  
  # NOTE: in this demonstration we name many of the variables _hash or _array. 
  # This is done for educational purposes. This is not typically done in code.
  
  # for(x = 0; x <= response_hash['results'].length-1; x++)
  # response_hash['results'].each do |character_data|
  #   character_data.each do |key, val|
  #     if key == "name"
  #       if character_data[key] == character
  #         binding.pry
  y = []
  x = response_hash['results'].find {|data| data["name"].downcase == character}
  films = x['films']
  array = films.collect do |url|
    resp_string = RestClient.get(url)
      resp_hash = JSON.parse(resp_string)
  end

  

  
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

end


def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.collect do |hash|
    puts hash["title"]
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
