class Car < ApplicationRecord
	belongs_to :brand

	def self.getAllCars
		uri = URI('http://localhost:3000/api/v1/cars')

		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)
		return ActiveSupport::JSON.decode(jsresponse)
	end

	def self.getCarsByBrand(id, cookie)
		uri = URI('http://localhost:3000/api/v1/cars/' + id.to_s + '/mycars')

		params = { :login => cookie[:login], :token => cookie[:token] }
		uri.query = URI.encode_www_form(params)	

		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)
		return ActiveSupport::JSON.decode(jsresponse)
	end

	def self.showCar(id)
		#http://localhost:3000/api/v1/distributors/1
		uri = URI('http://localhost:3000/api/v1/cars/' + id.to_s)
		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)

		# @distributor = jsresponse
		car = ActiveSupport::JSON.decode(jsresponse)
		puts car
		# car = OpenStruct.new(carJson)
		# car[:brandname] = Brand.findBrand(car.brand_id).name
		return car
		# end
	end
end
