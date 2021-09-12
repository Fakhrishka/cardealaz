class Brand < ApplicationRecord
	belongs_to :distributor
	belongs_to :user
	has_many :cars
	has_many :test_drives





end
