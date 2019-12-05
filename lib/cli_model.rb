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
        puts "Type '3' to view all of the coffees you haven't tried yet."
        puts "Type '4' to view all of the tasting experiences connected with your account."
        puts "Type '5' to log a review for a tasting under your account."
        puts "Type 'update' to change your unique username."
        puts "Type 'delete' to remove your account from the system."
        puts "Type 'quit' to exit the program."

        selection = gets.chomp

        case selection
        when selection = "1"
            wipe
            Coffee.coffee_options
            puts "\n\n"
            menu
        when selection = "2"
            taste
        when selection = "3"
            wipe
            @person.untasted_coffees
            puts "\n\n"
            menu
        when selection = "4"
            wipe
            @person.name_and_tastings
            puts "\n\n"
            menu
        when selection = "update"
            wipe
            update_name
        when selection = "delete"
            wipe
            cya_later

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
        puts "Type the coffee you drank to log it to your account."
        Coffee.all.map.with_index {|x, i| puts "#{i+1}. #{x.ctype}"}
        ans = gets.chomp
        puts "The coffee is logged in your account."
        puts "\n"
        like_to_leave_review
    end

    # def like_to_leave_review
    #     puts "Would you like to leave a review for this coffee? (y/n)"
    #     ans = gets.chomp
        
    #     if ans == "y"
    #         rating
    #     elsif ans == "n"
    #         # self.review = nil
    #         menu
    #     else
    #         puts "I'm sorry I didn't quite get that."
    #         like_to_leave_review
    #     end
    # end

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

    def update_name
        puts "Would you like to update your username? (y/n)"
        ans = gets.chomp
        
        if ans == "y"
            wipe
            @person.update_username
            menu
        elsif ans == "n"
            wipe
            menu
        else
            puts "I'm sorry I didn't quite get that."
            puts "\n"
            update_name
        end
    end

    def cya_later
        puts "Would you like to delete your account? (y/n)"
        ans = gets.chomp
        
        if ans == "y"
            puts "Are you super duper sure you want to delete your account? (y/n)"
            ans = gets.chomp
            
            if ans == "y"
                wipe
                @person.delete_account
                run
            elsif ans == "n"
                wipe
                menu
            else
                puts "I'm sorry I didn't quite get that."
                puts "\n"
                update_name
            end
        elsif ans == "n"
            wipe
            menu
        else
            puts "I'm sorry I didn't quite get that."
            puts "\n"
            update_name
        end
    end


    def run
        greet
        input_name
    end
end