class User < ActiveRecord::Base
    has_many :tastings
    has_many :coffees, through: :tastings
    has_many :reviews, through: :tastings
    has_one :favorite
end