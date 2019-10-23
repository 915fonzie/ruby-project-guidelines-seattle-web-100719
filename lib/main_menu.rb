require 'pry'
require_relative 'create_new_user'
require_relative 'high_score'

class MainMenu

    def self.logo
        print "test test test\n\n"
    end
    def self.printMenu
        system "clear"
        self.logo
        print "1. Create New User\n"
        print "2. Returning User\n"
        print "3. High Scores\n"
        print "4. Exit\n"
        print "\n\n\n\n"
    end

    def self.getInput
        print "Please type in a number choice: "
        input = STDIN.gets.chomp
    end

    def self.selections(input)
        case input
        when "1"
            CreateNewUser.fullName
        when "2"
            puts "the second"
        when "3"
            HighScore.highScoreGrid
        when "4"
            return
        else
            puts "You did not input any of the given choices, try again."
            MainMenu.selections(getInput())
        end
    end
end

