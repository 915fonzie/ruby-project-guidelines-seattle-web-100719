require_relative 'users'

class HighScore
    def self.highScoreGrid
        system "clear"
        print " ________________________\n|Name          High Score|\n|------------------------|\n"
        Users.all.each do |user|
            length_of_spaces_needed =user.first_name.length + user.last_name.length + user.high_score.to_s.length
            spaces_for_grid = "                       #{user.high_score}|"
            print "|#{user.first_name} #{user.last_name}#{spaces_for_grid.slice(length_of_spaces_needed..spaces_for_grid.length)}\n"
        end
        print " ________________________\n\n\n\n\n\n"

        print "Please press ENTER to return to the Main Menu "
        input = STDIN.gets.chomp
        if input != nil
            MainMenu.printMenu
            MainMenu.selections
        end
    end
end