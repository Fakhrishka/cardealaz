class Car < ApplicationRecord
	belongs_to :brand

	def self.getAllCars
		uri = URI('http://localhost:3000/api/v1/cars')
		puts 'YOY TEST'
		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)
		return ActiveSupport::JSON.decode(jsresponse)
	end

	def self.getDealerCars(id)
	end

	def self.showCar(id)
		#http://localhost:3000/api/v1/distributors/1
		uri = URI('http://localhost:3000/api/v1/cars/' + id.to_s)
		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)

		# @distributor = jsresponse
		carJson = ActiveSupport::JSON.decode(jsresponse)
		car = OpenStruct.new(carJson)
		car[:brandname] = Brand.find_brand(car.brand_id).name
		return car
		# end
	end
end
