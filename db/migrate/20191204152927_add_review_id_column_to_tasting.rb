class AddReviewIdColumnToTasting < ActiveRecord::Migration[6.0]
  def change
    add_column(:tastings, :review_id, :integer)
  end
end
