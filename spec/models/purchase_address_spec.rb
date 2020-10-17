require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '配送先登録' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end
    it "postal_code, send_area_choice_id, municipalities, address, building, phone_number, tokenがあれば出品登録できる" do
      expect(@purchase_address).to be_valid
    end

    it "postal_codeが空欄の場合登録できないこと" do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it "send_area_choice_idが空欄の場合登録できないこと" do
      @purchase_address.send_area_choice_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Send area choice Other than '---' select")
    end
    it "municipalitiesが空欄の場合登録できないこと" do
      @purchase_address.municipalities = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
    end
    it "addressが空欄の場合登録できないこと" do
      @purchase_address.address = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end
    it "phone_numberが空欄の場合登録できないこと" do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank","Phone number is invalid. Input Number")
    end
    it "tokenが空欄の場合登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank",)
    end
    
    it "postal_codeが正しい形式（○○○-○○○○）の場合でないと登録できないこと" do
      @purchase_address.postal_code = "1111-111"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end  
    it "postal_codeにハイフンがでないと登録できないこと" do
      @purchase_address.postal_code = "1111111"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end  
    it "send_area_choice_idが１の場合登録できないこと" do
      @purchase_address.send_area_choice_id = "1"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Send area choice Other than '---' select")
    end
    it "phone_numberが文字の場合登録できないこと" do
      @purchase_address.phone_number = "abcdefgi"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input Number")
    end
    it "phone_numberが全角数字の場合登録できないこと" do
      @purchase_address.phone_number = "１１１１１１１"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input Number")
    end

  end
end