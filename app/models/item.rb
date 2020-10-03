class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category_choice
    belongs_to_active_hash :item_status_choice
    belongs_to_active_hash :send_area_choice
    belongs_to_active_hash :send_date_choice
    belongs_to_active_hash :send_fee_choice

    belongs_to :user
    has_one_attached :image

    with_options presence: true do
        validates :name, :explanation, :price, :category_choice_id, :item_status_choice_id, :send_area_choice_id, :send_date_choice_id, :send_fee_choice_id ,:image
    end
    
    with_options numericality: { other_than: 1, message: " Other than '---' select"} do
        validates :category_choice_id, :item_status_choice_id, :send_area_choice_id, :send_date_choice_id, :send_fee_choice_id
    end

    validates :price, 
    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true, message: ' 半角数字(¥300〜9,999,999)で入力' }
end
