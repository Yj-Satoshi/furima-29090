class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

with_options presence: true do
  validates :nickname, :birth_day, :password, :first_name_kanji, :family_name_kanji, :first_name_kana, :family_name_kana
end

with_options format: { with: /\A[一-龥]+\z/ } do
  validates :first_name_kanji
  validates :family_name_kanji
end
with_options format: { with: /\A[ァ-ン]+\z/ } do
  validates :first_name_kana
  validates :family_name_kana
end

with_options format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, length: { minimum: 6 }  do
  validates :password
end

validates :email, format: { with: /@.+/ } 

has_many :items
end
