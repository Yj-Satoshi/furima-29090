class AddUserInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :family_name_kanji, :string
    add_column :users, :first_name_kanji, :string
    add_column :users, :family_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :birth_day, :date
  end
end
