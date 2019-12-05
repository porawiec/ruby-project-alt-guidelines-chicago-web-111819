class CommandLineInterface

    def wipe
        puts `clear`
    end
    
    def greet
        wipe
        puts "Welcome to Paul's Coffee House. Review and document your coffee intake!"
    end

    def input_name
        puts "Please enter your username or create a new one by typing here:"
        @userinput_username = gets.chomp
        username_correct
    end

    def username_correct
        puts "Is #{@userinput_username} correct? (y/n)"
        ans = gets.chomp
        if ans == "y"
            if User.find_by name: @userinput_username
                @person = User.find_by name: @userinput_username
                wipe
                puts "Hello #{@person.name}\n\n"
                menu
            else
                User.create(name: @userinput_username)
                @person = User.find_by name: @userinput_username
                wipe
                puts "Hello #{@person.name}\n\n"
                menu
            end
        elsif ans == "n"
            input_name
        else
            puts "I'm sorry I didn't quite get that."
            username_correct
        end
    end

    def menu

        puts "*** MAIN MENU ***"
        puts "Type '1' if you would like to see the available coffees and their contents."
        puts "Type '2' to log a coffee tasting under your account."
        puts "Type '3' to view all of the tasting experiences connected with your account"
        puts "Type 'quit' to exit the program."

        selection = gets.chomp

        case selection
        when selection = "1"
            wipe
            Coffee.coffee_options
            menu
        when selection = "2"
            puts "2"
        when selection = "3"
            wipe
            @person.name_and_tastings
            puts "\n\n"
            menu
        when selection = "quit"
            wipe
            exit

        else
            wipe
            puts "I'm sorry I didn't quite get that."
            puts "Please make another selection.\n\n"
            menu
        end
    end



    def taste
        puts "Type the corresponding number associated with the coffee you drank to log it to your account."
        #enumerate puts coffee options - coffee_id and ctype
        #gets.chomp the coffee_id
        puts "The coffee is logged in your account."
        like_to_leave_review
    end

    def like_to_leave_review
        puts "Would you like to leave a review for this coffee? (y/n)"
        ans = gets.chomp
        
        if ans == "y"
            rating
        elsif ans == "n"
            # self.review = nil
            menu
        else
            puts "I'm sorry I didn't quite get that."
            like_to_leave_review
        end
    end

    def rating
        puts "How would you rate this coffee on a scale of 0-10?"
        # user.tasting.review = gets.chomp
        rating_correct
    end

    def rating_correct
        puts "Is #{self.tasting.review} correct? (y/n)"
        ans = gets.chomp
        if ans == "y"
            menu
        elsif ans == "n"
            rating
        else
            puts "I'm sorry I didn't quite get that."
            rating_correct
        end
    end

    def myreviews
        self.tastings.all
    end


    def run
        greet
        input_name
    end
end