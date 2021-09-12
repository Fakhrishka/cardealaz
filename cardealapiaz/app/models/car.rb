class Car < ApplicationRecord
  belongs_to :brand
  has_many :car_datas
  has_many :test_drives
end
