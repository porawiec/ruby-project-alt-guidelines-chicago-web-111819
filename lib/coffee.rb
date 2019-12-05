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

    def self.coffee_options

        Coffee.all.each { |i|
            if i.milk == 0 && i.foam == 0
                puts "#{i.ctype}\n #{i.shots} espresso shot(s)\n without steamed milk\n without foam\n\n"
            elsif i.milk == 1 && i.foam == 0
                puts "#{i.ctype}\n #{i.shots} espresso shot(s)\n with steamed milk\n without foam\n\n"
            elsif i.milk == 0 && i.foam == 1
                puts "#{i.ctype}\n #{i.shots} espresso shot(s)\n without steamed milk\n with foam\n\n"
            else i.milk == 1 && i.foam == 1
                puts "#{i.ctype}\n #{i.shots} espresso shot(s)\n with steamed milk\n with foam\n\n"
            end
        }
    end
end