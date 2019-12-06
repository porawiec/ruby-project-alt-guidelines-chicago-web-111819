class User < ActiveRecord::Base
    has_many :tastings
    has_many :coffees, through: :tastings
    has_many :reviews, through: :tastings
    belongs_to :coffee

    def self.all_tastings
        self.all.map do |user|
            user.name_and_tastings
        end
    end

    def name_and_tastings
        puts "#{self.name} - #{self.tastings.count} total tasting experiences\n"
        user_beverages
    end

    def user_beverages
        self.coffees.each {|x| puts "#{x.ctype}"}
    end

    def tastes_of_coffee(coffee)
        self.coffees.where(coffee_id: coffee.id)
    end

    def untasted_coffees
        untasted = Coffee.all - self.coffees
        puts "#{self.name} - #{untasted.count} missing tasting experiences\n"
        untasted.each {|x| puts "#{x.ctype}"}
    end

    def tie_tasting_to_coffee(coffee_name)
        cafe_array = Coffee.all.map {|x| x.ctype}
        if cafe_array.include? coffee_name
            cafe = Coffee.find_by ctype: coffee_name
            self.tastings.create(coffee_id: cafe.id)
            puts "The coffee is logged in your account."
        else
            puts "I'm sorry. That coffee does not exist."
            puts "Please enter a coffee."
            try_again_cof = gets.chomp
            tie_tasting_to_coffee(try_again_cof)
        end
    end

    def tie_review_to_tasting(num)
        self.reviews.create(rating: num)
    end


    def update_username
        user = User.find_by(name: self.name)
        puts "Please type your new username here"
        puts "or type 'quit' to return back to the main menu:"
        name_array = User.all.map {|x| x.name}
        new_name = gets.chomp
            if name_array.include? new_name
                puts `clear`
                puts "I'm afraid I can't do that."
                puts "Please try again."
                puts "\n"
                update_username
            elsif name_array.exclude? new_name
                self.update(name: new_name)
                puts "\n"
                puts "You have successfully changed your name #{self.name}"
                puts "\n"
                return
            elsif new_name == "quit"
                puts `clear`
                return
            else
                puts "I'm sorry I didn't quite get that."
                puts "\n"
                update_username
            end
    end

    def delete_account
        del_user = User.find_by name: self.name
        del_user.destroy
    end
    
end