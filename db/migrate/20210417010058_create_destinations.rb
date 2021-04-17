class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string     :postcode,         null: false
      t.integer    :prefecture_id,    null:false
      t.string     :city,             null:false
      t.string     :address,          null:false
      t.string     :building_name
      t.string     :phone_number,     null:false
      t.references :purchase_history, null:false, foreign_key:true
      t.timestamps
    end
  end
end
