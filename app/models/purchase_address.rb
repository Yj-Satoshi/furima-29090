class PurchaseAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :send_area_choice_id, :municipalities, :address, :building, :phone_number,:token, :user_id, :item_id

    with_options presence: true do
        validates :postal_code, format: {with:/\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
        validates :phone_number, format: {with:/\A[0-9]+\z/, message: "is invalid. Input Number"}, length: { maximum: 11}
        validates :municipalities, :address
        validates :token
    end

    validates :send_area_choice_id, numericality: { other_than: 1, message: " Other than '---' select"}


    def save
        purchase = Purchase.create(user_id: user_id, item_id: item_id)
        Address.create(postal_code: postal_code, send_area_choice_id: send_area_choice_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
    end
end