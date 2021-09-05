class Brand < ApplicationRecord
	belongs_to :distributor

	def self.getAllBrands
		uri = URI('http://localhost:3000/api/v1/brands')
		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)
		# @users = jsresponse
		# @users = ActiveSupport::JSON.decode(jsresponse)
		brandsJson = ActiveSupport::JSON.decode(jsresponse)
		# @cars = carsJson
		brands = []
		brandsJson.each do |brand_j|
			brands << OpenStruct.new(brand_j)
		end

		return brands
	end

  	def self.find_brand(id)
		#http://localhost:3000/api/v1/distributors/1
		uri = URI('http://localhost:3000/api/v1/brands/' + id.to_s)
		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)

		brandJson = ActiveSupport::JSON.decode(jsresponse)
		return OpenStruct.new(brandJson)
	end
end
