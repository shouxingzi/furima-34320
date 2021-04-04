class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :password,        length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
  validates :first_name,      presence: true
  validates :first_name,      format:{with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name,       presence: true
  validates :last_name,       format:{with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana, presence: true
  validates :first_name_kana, format:{with: /\A[\p{katakana}\u{30fc}]+\z/}
  validates :last_name_kana,  presence: true
  validates :last_name_kana,  format:{with: /\A[\p{katakana}\u{30fc}]+\z/}
  validates :birthday,        presence: true
  

end
