class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.refarences :user        ,foreign_ky: true
      t.string :name            ,null: false, default:""
      t.text :explanation       ,null: false, default:""
      t.integer :price          ,null: false
      t.integer :category_id    ,null: false
      t.integer :item_status_id ,null: false
      t.integer :send_area_id   ,null: false
      t.integer :send_date_id   ,null: false
      t.integer :send_fee_id    ,null: false
      t.timestamps
    end
  end
end
