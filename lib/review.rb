class Review < ActiveRecord::Base
    belongs_to :tasting
    belongs_to :user
end

