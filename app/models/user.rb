class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  vlidates :nickname,        presence: true
  vlidates :first_name,      presence: true
  vlidates :last_name,       presence: true
  vlidates :first_name_kana, presence: true
  vlidates :last_name_kana,  presence: true
  vlidates :birthday,        presence: true

end
