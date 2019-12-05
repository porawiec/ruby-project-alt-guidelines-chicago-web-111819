class SingleSourceTruthRemoveReviewidFromTastingsWithCoffeeIdAndUserIdFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :tastings, :review_id
    remove_column :reviews, :coffee_id
    remove_column :reviews, :user_id
  end
end
