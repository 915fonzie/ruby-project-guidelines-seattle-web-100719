class GamePlay
    def self.playGame(user)
        system "clear"
        if user.tries_left == 0
            print "Congratulations! You've achieved greatness by failing!"
            #still need to add info here
        end

        rand_id = rand(Pokemons.count)
        if UsersPokemons.find_by(user_id: user.id,pokemon_id: rand_id)
            rand_id = rand(Pokemons.count)
        end
        rand_pokemon = Pokemons.find_by(id: rand_id)
        print rand_pokemon.ascii

    end
end