class ChangeReviewColumnInReviewToRating < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :review, :rating
  end
end
