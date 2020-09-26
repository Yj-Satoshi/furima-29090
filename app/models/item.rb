class Item < ApplicationRecord

    with_options presence: true do
        validates :name, :explanation, :price, :category_id, :item_status_id, :send_area_id, :send_date_id, :send_fee_id 
    end

    belongs_to :user
    has_one_attached :image
end
