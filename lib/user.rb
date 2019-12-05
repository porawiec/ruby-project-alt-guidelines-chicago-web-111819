class User < ActiveRecord::Base
    has_many :tastings
    has_many :coffees, through: :tastings
    has_many :reviews, through: :tastings
    belongs_to :coffee

    def self.all_tastings
        self.all.map do |tastings|
            self.tastings
        end
      end
end