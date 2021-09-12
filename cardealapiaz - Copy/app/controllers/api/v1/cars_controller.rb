class Api::V1::CarsController < ApplicationController
	def index
		# cars = Car.all
		# render json: cars

		cars = {}
		Brand.all.each do |brand|
			cars[brand.name] = Car.where(:brand_id => brand.id)
		end

		render json: cars


		# render json: cars.map { |car| [Brand.find_by(:id => car.id).name, car]}
	end

	# GET /cars
	def show
		car = Car.find(params[:id])
		puts car.inspect

		render json: car
	end


	# POST /cars
	def create
		car_params
		@car = Car.new(car_params)
		if @car.save
			render json: @car
		else
			render error: { error: "Fail to create user"}, status: 400
		end
	end

	def car_params
		puts params
		params.permit(:brand_id, :model, :test_drive)
    end
end
