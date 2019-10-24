require_relative 'main_menu'
require 'pry'

class GamePlay
    def self.playGame(user)
        system "clear"
        # rand_id_array = (1..Pokemons.count).to_a.shuffle
        # if UsersPokemons.find_by(user_id: user.id,pokemon_id: rand_id)
        #     playGame(user)
        # end
        rand_pokemon = Pokemons.find_by(id: rand_id)
        puts rand_pokemon.ascii.magenta.on_white
        puts "What is the name of this Pokemon? "
        all_answer_choices = []
        all_answer_choices.push(rand_pokemon)
        wrong_answer1_id = rand(1..Pokemons.count)
        wrong_answer1 = Pokemons.find_by(id: wrong_answer1_id)
        all_answer_choices.push(wrong_answer1)
        wrong_answer2_id = rand(1..Pokemons.count)
        wrong_answer2 = Pokemons.find_by(id: wrong_answer2_id)
        all_answer_choices.push(wrong_answer2)
        wrong_answer3_id = rand(1..Pokemons.count)
        wrong_answer3 = Pokemons.find_by(id: wrong_answer3_id)
        all_answer_choices.push(wrong_answer3)
        shuffled_answers = all_answer_choices.shuffle
        puts "a. #{shuffled_answers[0].name}"
        puts "b. #{shuffled_answers[1].name}"
        puts "c. #{shuffled_answers[2].name}"
        puts "d. #{shuffled_answers[3].name}"

        answer_choices = {"a" => shuffled_answers[0], "b" => shuffled_answers[1], "c" => shuffled_answers[2], "d" => shuffled_answers[3]}
        checkAnswer(answer_choices,rand_pokemon, user)
    end

    def self.checkAnswer(answers,correct_answer, user)
        puts "Please enter your answer of either a,b,c or d: "
        input = STDIN.gets.chomp
        case input
        when "a","b","c","d"
            if answers[input] == correct_answer
                new_connection = UsersPokemons.create(user_id: user.id,pokemon_id: correct_answer.id)
                new_connection.save
                system "clear"
                puts "You got the answer correct!"
                user.current_score += 1
                user.save
                subMenuBetweenQuestions(user)
            else
                system "clear"
                puts "you got it wrong unfortunately...\n"
                user.tries_left -= 1
                user.save
                if user.tries_left >= 1
                    subMenuBetweenQuestions(user)
                elsif user.tries_left == 0
                    system "clear"
                    puts "Congratulations! You've achieved greatness by failing!\nYour tries have been reset and the pokemon you had gotten is back to zero!\n"
                    if user.high_score < user.current_score
                        user.high_score = user.current_score
                    end
                    UsersPokemons.where(user_id: user.id).destroy_all
                    user.tries_left = 5 
                    user.current_score = 0
                    user.save
                    puts "Please press ENTER to go back to the Main Menu"
                    result = STDIN.gets.chomp
                    MainMenu.printMenu
                    MainMenu.selections
                end
            end
        else
            puts "you did not input any of the given choices, please try again"
            checkAnswer(answers,correct_answer, user)
        end
    end

    def self.subMenuBetweenQuestions(user)
        puts "If you would like to continue, please press ENTER:\nIf you would like to see which pokemon you have gotten correct, please enter 1:\nIf you would like to go back to the Main Menu, please enter 2:"
        second_input = STDIN.gets.chomp
        case second_input
        when "1"
            pokemon_id_collected = UsersPokemons.where("user_id = ?", user.id)
            if pokemon_id_collected.count == 151
                "WOW!! You've managed to get all 151 pokemon!"
            elsif pokemon_id_collected != nil || pokemon_id_collected != []
                puts "These are the pokemon you have gotten correct so far!\n\n"
                pokemon_id_collected.each do |poke_id| 
                    pokemon = Pokemons.find_by(id: poke_id.pokemon_id)
                    puts pokemon.name
                end
                puts ""
                subMenuBetweenQuestions(user)
            else
                puts "So far, you haven't gotten any Pokemon correctly!"
            end
        when "2"
            MainMenu.printMenu
            MainMenu.selections
        else
            playGame(user)
        end
    end
end