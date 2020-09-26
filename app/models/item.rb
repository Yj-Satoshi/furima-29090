class Item < ApplicationRecord

    with_options presence: true do
        validates :name, :explanation, :price, :category_id, :item_status_id, :send_area_id, :send_date_id, :send_fee_id 
    end

    belongs_to :user
    has_one_attached :image

    extend ActiveHash::associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :item_status
    belongs_to_active_hash :send_area
    belongs_to_active_hash :send_date
    belongs_to_active_hash :send_fee

    with_options numericality: { other_than: 1} do
        validates :category_id, :item_status_id, :send_area_id, :send_date_id, :send_fee_id
    end
end
