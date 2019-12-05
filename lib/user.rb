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
        Coffees.all - self.coffees
    end



    
end