class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,           null: false
      t.text       :description_of_item,    null: false
      t.integer    :category_id,            null: false
      t.integer    :product_condition_id,   null: false
      t.integer    :shipping_fee_burden_id, null: false
      t.integer    :prefecture_id,          null: false
      t.integer    :day_to_ship_id,         null: false
      t.integer    :price,                  null: false
      t.references :user,                   null: false, foreign_key:true
      t.timestamps
    end
  end
end
