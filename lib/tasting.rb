class Tasting < ActiveRecord::Base
    belongs_to :coffee
    belongs_to :user
    has_one :review
end