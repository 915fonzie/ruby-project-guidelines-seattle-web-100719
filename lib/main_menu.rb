require 'pry'
require_relative 'create_new_user'
require_relative 'high_score'
require_relative 'returning_user'
require_relative 'how_to_play'
require_relative 'game_play'

class MainMenu
    def self.logo
        puts "   ______                            ______ __            __".bold.red
        puts "  / ____/__  __ ___   _____ _____   /_  __// /_   ____ _ / /_".bold.red
        puts ' / / __ / / / // _ \ / ___// ___/    / /  / __ \ / __ `// __/'.bold.white
        puts "/ /_/ // /_/ //  __/(__  )(__  )    / /  / / / // /_/ // /_" .bold.red
        puts '\____/ \__._/ \___//____//____/    /_/  /_/ /_/ \__._/ \__/'.bold.red
        banner = File.read('./lib/Pokemon_title.txt')
        puts banner.bold.yellow

    end
    def self.printMenu
        system "clear"
        self.logo
        puts "1. Create New User"
        puts "2. Returning User"
        puts "3. High Scores\n"
        print "4. How to Play\n"
        print "5. Exit\n"
        print "\n\n"
    end

    def self.selections
        print "Please type in a number choice: "
        input = STDIN.gets.chomp
        case input
        when "1"
            CreateNewUser.creatingNewUser
        when "2"
            ReturningUser.findUser
        when "3"
            HighScore.highScoreGrid
        when "4"
            HowToPlay.description
        when "5"
            exit
        else
            puts "\nYou did not input any of the given choices, try again."
            MainMenu.selections
        end
    end
end

