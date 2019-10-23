require_relative 'main_menu'

class HowToPlay
    def self.description
        system "clear"
        print "this will have all the info about how to play the game\n"
        print "Please press ENTER to return to the Main Menu"
        STDIN.gets.chomp
        MainMenu.printMenu
        MainMenu.selections
    end
end