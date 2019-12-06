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
            wipe
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
        @person.tie_tasting_to_coffee(ans)
        puts "\n"
        taste_menu
    end

    def taste_menu
        puts "Enter '1' to leave a review for your recorded coffee."
        puts "Enter '2' to log another coffee or try again if it failed."
        puts "Enter '3' to get back to the main menu."

        choice = gets.chomp

        case choice
        when choice = "1"
            leave_review
        when choice = "2"
            wipe
            taste
        when choice = "3"
            wipe
            menu
        else
            wipe
            puts "I'm sorry I didn't quite get that."
            puts "Please make another selection.\n\n"
            menu
        end
    end


    def leave_review
        puts "How would you rate this coffee on a scale of 0-10?"
        num = gets.chomp
        puts "Is a rating of #{num} correct? (y/n)"
        puts "Or type 'quit' to leave without leaving a review."
        latest_tasting = Tasting.all.last
        ans = gets.chomp
        if ans == "y"
            Review.create(rating: num, tasting_id: latest_tasting.id)
            wipe
            puts "You have successfully reviewed a coffee."
            puts "\n"
            menu
        elsif ans == "n"
            wipe
            leave_review
        elsif ans == "quit"
            menu
        else
            puts "I'm sorry I didn't quite get that."
            puts "\n"
            leave_review
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