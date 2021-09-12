class User < ApplicationRecord
	acts_as_token_authenticatable
	has_one :user_info
	has_many :brands
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
