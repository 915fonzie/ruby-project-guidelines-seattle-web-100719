class CreateNewUser
    def self.creatingNewUser
        system "clear"
        name = Users.create
        print "What is your First name: "
        name.first_name = STDIN.gets.chomp
        print "\nWhat is your Last name: "
        name.last_name = STDIN.gets.chomp
        name.high_score = 0
        name.tries_left = 6
        name.save
        print "Thank you for creating an account with us #{name.first_name}!\n\n\n\n"
        subMenuOptions
    end

    def self.subMenuOptions
        print "If you would like to go back to the Main Menu, please enter 1.\nIf you would like to continue and start playing the game, please enter 2: "
        input = STDIN.gets.chomp
        case input
        when "1"
            MainMenu.printMenu
            MainMenu.selections
        when "2"
            puts "still not implemented"
        else
            puts "You did not input any of the given choices, try again."
            subMenuOptions
        end
    end
end