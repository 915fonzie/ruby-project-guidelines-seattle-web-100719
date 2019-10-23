require 'pry'
file = File.read('./db/pokemon.json')
pokedex = JSON.parse(file)

pokedex.each do |pokemon|
    Pokemons.create(name: pokemon[1]["name"], ascii: pokemon[1]["ascii"])
end