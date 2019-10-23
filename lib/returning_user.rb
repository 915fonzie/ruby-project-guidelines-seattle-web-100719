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
            subMenuOptions(fname,lname)
        else
            system "clear"
            print "Unfortunately we could not find your account.\nIf you would like to go back to the Main Menu, please enter 1.\nIf you would like to try again, please press ENTER "
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

    def self.subMenuOptions(fname,lname)
        print "If you would like to go back to the Main Menu, please enter 1.\n\nIf you would like to update your name, please enter 2.\n\nIf you would like to continue and start playing the game, please enter 3: "
        input = STDIN.gets.chomp
        case input
        when "1"
            MainMenu.printMenu
            MainMenu.selections
        when "2"
            full_name = changeName(fname,lname)
            print "Your name has successfully been updated!\n"
            subMenuOptions(full_name[0], full_name[1])
        when "3"
            puts "still not implemented"
        else
            puts "You did not input any of the given choices, try again."
            subMenuOptions(fname, lname)
        end
    end
    def self.changeName(fname, lname)
        full_name = []
        user = Users.find_by(first_name: fname,last_name: lname)
        print "What is the new first name: "
        new_fname = STDIN.gets.chomp
        print "What is the new last name: "
        new_lname = STDIN.gets.chomp
        user.first_name = new_fname
        user.last_name = new_lname
        user.save
        full_name[0] = user.first_name
        full_name[1] = user.last_name
        full_name
    end
end