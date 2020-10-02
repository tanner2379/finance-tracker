class RemoveNameFromStocks < ActiveRecord::Migration[6.0]
  def change
    remove_column :stocks, :name
  end
end
