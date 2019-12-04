class RemovePurchaseColumnFromTastings < ActiveRecord::Migration[6.0]
  def change
    remove_column :tastings, :purchase
  end
end
