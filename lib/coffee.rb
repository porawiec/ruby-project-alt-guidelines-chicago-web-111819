class Coffee < ActiveRecord::Base
    has_many :tastings
    has_many :users, through: :tastings
    belongs_to :user
end