class CreateNewUser
    def self.fullName
        system "clear"
        name = Users.create
        print "What is your First name: "
        name.first_name = STDIN.gets.chomp
        print "\nWhat is your Last name: "
        name.last_name = STDIN.gets.chomp
        name.high_score = 0
        name.tries_left = 6
        name.save
    end
end