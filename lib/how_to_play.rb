require_relative 'main_menu'

class HowToPlay
    def self.description
        system "clear"
        puts "this will have all the info about how to play the game"
        print "Please press ENTER to return to the Main Menu"
        STDIN.gets.chomp
        MainMenu.printMenu
        MainMenu.selections
    end
end