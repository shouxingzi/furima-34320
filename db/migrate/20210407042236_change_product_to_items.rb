class ChangeProductToItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :products, :items
  end
end
