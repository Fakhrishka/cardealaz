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

	def self.getCarsByBrand(id)
		uri = URI('http://localhost:3000/api/v1/brandcars/' + id.to_s)
		puts uri
		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)

		puts jsresponse
		carsJson = ActiveSupport::JSON.decode(jsresponse)
		return OpenStruct.new(carsJson)
	end

  	def self.findBrand(id)
		#http://localhost:3000/api/v1/distributors/1
		uri = URI('http://localhost:3000/api/v1/brands/' + id.to_s)
		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)

		brandJson = ActiveSupport::JSON.decode(jsresponse)
		puts brandJson
		return OpenStruct.new(brandJson)
	end
end
