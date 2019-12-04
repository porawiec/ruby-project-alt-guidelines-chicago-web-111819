class CommandLineInterface

    def greet
        puts "Welcome to Coffee Reviews. Review and document your coffee intake!"
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
            # # if user.name exists
            #     menu
            # else
            #     # User.create(name: @var)
            #     menu
            # end
        elsif ans == "n"
            input_name
        else
            puts "I'm sorry I didn't quite get that."
            username_correct
        end
    end

    def menu
        # puts "Hello #{user.name}\n"
        puts "*** MAIN MENU ***"
        puts "Type 'coffees' if you would like to see the available coffees and their contents."
        puts "Type 'taste' to log a coffee under your account."
        puts "Type 'myreviews' to view all of the reviews connected with your account"
    end

    def coffee_options
        # enumerate
        puts "#{coffees.id}. #{coffees.ctype} has espresso shots: #{coffees.shots}"

            if coffees.milk == 1
                puts "with steamed milk"
            else
                puts "without steamed milk"
            end

            if coffee.foam == 1
                puts "with microfoam"
            else
                puts "without steamed milk"
            end
        # enumerate
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