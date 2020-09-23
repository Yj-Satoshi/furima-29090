class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


with_options presence: true, format: { with: /\A[一-龥]+\z/ } do
  validates :first_name_kanji
  validates :family_name_kanji
end
with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
  validates :first_name_kana
  validates :family_name_kana
end

validates :email, format: { with: /@.+/ } 

validates :password,    length: { minimum: 6 }   
validates :nickname, :birth_day, presence: true
end
