class CreateCoffees < ActiveRecord::Migration[6.0]
  def change
      create_table :coffees do |t|
          t.string :ctype
          t.integer :shots
          t.integer :milk
          t.integer :foam
          t.timestamps
      end
  end
end
