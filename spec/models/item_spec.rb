require 'rails_helper'

RSpec.describe Item, type: :model do
describe '商品出品' do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/test_image.png")
  end
  it "name, explanation, price, category_choice_id, item_status_choice_id, send_date_choice_id, send_fee_choice_id, imageがあれば出品登録できる" do
    expect(@item).to be_valid
  end

  it "nameが空欄の場合登録できないこと" do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end
  it "explanationが空欄の場合登録できないこと" do
    @item.explanation = nil 
    @item.valid?
    expect(@item.errors.full_messages).to include("Explanation can't be blank")
  end
  it "priceが空欄の場合登録できないこと" do
    @item.price = nil 
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it "category_choice_idが空欄の場合登録できないこと" do
    @item.category_choice_id = nil 
    @item.valid?
    expect(@item.errors.full_messages).to include("Category choice can't be blank", "Category choice  Other than '---' select")
  end
  it "item_status_choice_idが空欄の場合登録できないこと" do
    @item.item_status_choice_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Item status choice can't be blank", "Item status choice  Other than '---' select")
  end
  it "send_area_choice_idが空欄の場合登録できないこと" do
    @item.send_area_choice_id = nil 
    @item.valid?
    expect(@item.errors.full_messages).to include("Send area choice can't be blank", "Send area choice  Other than '---' select")
  end
  it "send_date_choice_idが空欄の場合登録できないこと" do
    @item.send_date_choice_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Send date choice can't be blank", "Send date choice  Other than '---' select")
  end
  it "send_fee_choice_idが空欄の場合登録できないこと" do
    @item.send_fee_choice_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Send fee choice can't be blank", "Send fee choice  Other than '---' select")
  end
  it "imageが空欄の場合登録できないこと" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it "category_choice_idが1の場合登録できないこと" do
    @item.category_choice_id = 1 
    @item.valid?
    expect(@item.errors.full_messages).to include("Category choice  Other than '---' select")
  end
  it "item_status_choice_idが1の場合登録できないこと" do
    @item.item_status_choice_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Item status choice  Other than '---' select")
  end
  it "send_area_choice_idが1の場合登録できないこと" do
    @item.send_area_choice_id = 1 
    @item.valid?
    expect(@item.errors.full_messages).to include("Send area choice  Other than '---' select")
  end
  it "send_date_choice_idが1の場合登録できないこと" do
    @item.send_date_choice_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Send date choice  Other than '---' select")
  end
  it "send_fee_choice_idが1の場合登録できないこと" do
    @item.send_fee_choice_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Send fee choice  Other than '---' select")
  end

  it "priceがの10,000,000円以上の場合では登録できないこと" do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price  半角数字(¥300〜9,999,999)で入力")
  end
  it "priceが300円未満の場合では登録できないこと" do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price  半角数字(¥300〜9,999,999)で入力")
  end
  it "priceが文字の場合では登録できないこと" do
    @item.price = "aaaa"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price  半角数字(¥300〜9,999,999)で入力")
  end
  it "priceが全角数字の場合では登録できないこと" do
    @item.price = "１０００"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price  半角数字(¥300〜9,999,999)で入力")
  end
end

end
