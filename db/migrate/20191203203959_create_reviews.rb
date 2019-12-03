class CreateReviews < ActiveRecord::Migration[6.0]
  def change
      create_table :reviews do |t|
          t.float :review
          t.integer :tasting_id
          t.integer :user_id
          t.integer :coffee_id
          t.timestamps
      end
  end
end