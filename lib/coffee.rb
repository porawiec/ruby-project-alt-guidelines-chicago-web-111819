class Coffee < ActiveRecord::Base
    has_many :tastings
    has_many :users, through: :tastings
end