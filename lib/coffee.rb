class Coffee < ActiveRecord::Base
    has_many :tastings
    has_many :users, through: :tastings
    belongs_to :user

    def reviews
        tastings = self.tastings.select do |tasting|
            tasting.review
        end
        tastings.map {|x| x.review}
    end

        # def coffee_options
    #     # enumerate
    #     puts "#{coffees.id}. #{coffees.ctype} has espresso shots: #{coffees.shots}"

    #         if coffees.milk == 1
    #             puts "with steamed milk"
    #         else
    #             puts "without steamed milk"
    #         end

    #         if coffee.foam == 1
    #             puts "with microfoam"
    #         else
    #             puts "without steamed milk"
    #         end
    #     # enumerate
    # end
end