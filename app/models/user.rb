class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday    
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[\p{katakana}\u{30fc}]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
  validates :password,length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }

  has_many :items
  has_many :purchase_histories
end
