class User < ApplicationRecord
  belongs_to :distributor
  belongs_to :brand
end
