class CreateTastings < ActiveRecord::Migration[6.0]
  def change
      create_table :tastings do |t|
          t.integer :user_id
          t.integer :coffee_id
          t.integer :purchase
          t.timestamps
      end
  end
end