class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category_choice
    belongs_to_active_hash :item_status_choice
    belongs_to_active_hash :send_area_choice
    belongs_to_active_hash :send_date_choice
    belongs_to_active_hash :send_fee_choice

    with_options presence: true do
        validates :name, :explanation, :price, :category_id, :item_status_id, :send_area_id, :send_date_id, :send_fee_id ,:image
    end
    
    with_options numericality: { other_than: 1, message: " Other than '---' select"} do
        validates :category_id, :item_status_id, :send_area_id, :send_date_id, :send_fee_id
    end

    validates :price, 
    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true, message: ' 半角数字(¥300〜9,999,999)で入力' }
end
