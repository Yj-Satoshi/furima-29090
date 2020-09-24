require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "email, password, nickname, birth_day, family_name_kanji, family_name_kana, first_name_kanji, first_name_kanaの全てが存在すれば登録できること" do
      expect(@user).to be_valid
    end
    it "emailが空欄の場合登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空欄の場合登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "nicknameが空欄の場合登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "family_name_kanjiが空欄の場合登録できないこと" do
      @user.family_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji can't be blank", "Family name kanji is invalid")
    end
    it "first_name_kanjiが空欄の場合登録できないこと" do
      @user.first_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank", "First name kanji is invalid")
    end
    it "family_name_kanaが空欄の場合登録できないこと" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is invalid")
    end
    it "first_name_kanaが空欄の場合登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
    end
    it "birth_dayが空欄の場合登録できないこと" do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空欄の場合登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが５文字以下の場合では登録できないこと" do
      @user.password = "pass1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが数字のみの場合では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordがアルファベットのみの場合では登録できないこと" do
      @user.password = "password"
      @user.password_confirmation = "password"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "emailに＠がないの場合では登録できないこと" do
      @user.email = "samplesample.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid", "Email is invalid")
    end
    it "emailが重複の場合では登録できないこと" do
      @user.save
      user2 = FactoryBot.build(:user, email: @user.email)
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
    it "family_name_kanjiがカナ（全角）の場合では登録できないこと" do
      @user.family_name_kanji = "ヤマダ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji is invalid")
    end
    it "family_name_kanjiがカナ（半角）の場合では登録できないこと" do
      @user.family_name_kanji = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji is invalid")
    end
    it "family_name_kanjiが平仮名の場合では登録できないこと" do
      @user.family_name_kanji = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji is invalid")
    end
    it "family_name_kanjiがアルファベットの場合では登録できないこと" do
      @user.family_name_kanji = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji is invalid")
    end
    it "first_name_kanjiがカナ（全角）の場合では登録できないこと" do
      @user.first_name_kanji = "リクロウ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end
    it "first_name_kanjiがカナ（半角）の場合では登録できないこと" do
      @user.first_name_kanji = "ﾘｸﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end
    it "first_name_kanjiが平仮名の場合では登録できないこと" do
      @user.first_name_kanji = "りくろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end
    it "first_name_kanjiがアルファベットの場合では登録できないこと" do
      @user.first_name_kanji = "rikurou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end
    it "family_name_kanaが漢字の場合では登録できないこと" do
      @user.family_name_kana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "family_name_kanaがカナ（半角）の場合では登録できないこと" do
      @user.family_name_kana = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "family_name_kanaが平仮名の場合では登録できないこと" do
      @user.family_name_kana = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "family_name_kanaがアルファベットの場合では登録できないこと" do
      @user.family_name_kana = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "first_name_kanaが漢字の場合では登録できないこと" do
      @user.first_name_kana = "陸郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "first_name_kanaがカナ（半角）の場合では登録できないこと" do
      @user.first_name_kana = "ﾘｸﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "first_name_kanaが平仮名の場合では登録できないこと" do
      @user.first_name_kana = "りくろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "first_name_kanaがアルファベットの場合では登録できないこと" do
      @user.first_name_kana = "rikurou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
  end
end

