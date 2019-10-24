class GamePlay
    def self.playGame(user)
        system "clear"
        if user.tries_left == 0
            puts "Congratulations! You've achieved greatness by failing!"
            #still need to add info here
        end

        rand_id = rand(Pokemons.count)
        if UsersPokemons.find_by(user_id: user.id,pokemon_id: rand_id)
            rand_id = rand(Pokemons.count)
        end
        rand_pokemon = Pokemons.find_by(id: rand_id)
        puts rand_pokemon.ascii
        puts "What is the name of this Pokemon? "
        answer_order = rand(1..4)
        wrong_answer1_id = rand(1..Pokemons.count)
        wrong_answer1 = Pokemons.find_by(id: wrong_answer1_id)
        wrong_answer2_id = rand(Pokemons.count)
        wrong_answer2 = Pokemons.find_by(id: wrong_answer2_id)
        wrong_answer3_id = rand(Pokemons.count)
        wrong_answer3 = Pokemons.find_by(id: wrong_answer3_id)

        case answer_order
        when 1
            puts "a. #{rand_pokemon.name}"
            puts "b. #{wrong_answer1.name}"
            puts "c. #{wrong_answer2.name}"
            puts "d. #{wrong_answer3.name}"
        when 2
            puts "a. #{wrong_answer1.name}"
            puts "b. #{rand_pokemon.name}"
            puts "c. #{wrong_answer2.name}"
            puts "d. #{wrong_answer3.name}"
        when 3
            puts "a. #{wrong_answer1.name}"
            puts "b. #{wrong_answer2.name}"
            puts "c. #{rand_pokemon.name}"
            puts "d. #{wrong_answer3.name}"
        when 4
            puts "a. #{wrong_answer1.name}"
            puts "b. #{wrong_answer2.name}"
            puts "c. #{wrong_answer3.name}"
            puts "d. #{rand_pokemon.name}"
        end
        


    end
end