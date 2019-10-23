class CreateNewUser
    def self.creatingNewUser
        user = Users.create
        system "clear"
        print "What is your First name: "
        user.first_name = STDIN.gets.chomp
        print "\nWhat is your Last name: "
        user.last_name = STDIN.gets.chomp
        user.high_score = 0
        user.tries_left = 6
        user.save
        system "clear"
        print "Thank you for creating an account with us #{user.first_name}!\n\n\n\n"
        subMenuOptions(user)
    end

    def self.subMenuOptions(user)
        print "If you would like to go back to the Main Menu, please enter 1.\nIf you would like to continue and start playing the game, please enter 2: "
        input = STDIN.gets.chomp
        case input
        when "1"
            MainMenu.printMenu
            MainMenu.selections
        when "2"
            GamePlay.playGame(user)
        else
            puts "You did not input any of the given choices, try again."
            subMenuOptions(user)
        end
    end
end