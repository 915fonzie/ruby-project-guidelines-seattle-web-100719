require_relative 'main_menu'

class ReturningUser
    def self.findUser
        system "clear"

        print "Hello returning user! Please provide your name so that we may find your account."
        print "\nWhat is your first name: "
        fname = STDIN.gets.chomp
        print "\nWhat is your last name: "
        lname = STDIN.gets.chomp
        if Users.find_by(first_name: fname,last_name: lname)
            system "clear"
            print "We have found your account! Welcome back, #{fname}!\n\n"
            subMenuOptions
        else
            print "Unfortunately we could not find your account.\nIf you would like to go back to the Main Menu, please enter 1.\nIf you would like to try again, please enter any other value or character: "
            input = STDIN.gets.chomp
            case input
            when "1"
                MainMenu.printMenu
                MainMenu.selections
            else
                findUser
            end
        end

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