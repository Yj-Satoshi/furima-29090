class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,        foreign_key: true
      t.string :name,            null: false, default:""
      t.text :explanation,       null: false
      t.integer :price,          null: false
      t.integer :category_choice_id,    null: false
      t.integer :item_status_choice_id, null: false
      t.integer :send_area_choice_id,   null: false
      t.integer :send_date_choice_id,   null: false
      t.integer :send_fee_choice_id,    null: false
      t.timestamps
    end
  end
end
