class Api::V1::CarsController < ApplicationController
	def index
		@cars = Car.all
		render json: @cars
		# render json: @cars.map { |car| [Brand.find_by(:id => car.id).name, car]}
	end

	def show
		@car = Car.find(params[:id])
		render json: @car
	end

	def create
		@car = Car.new(car_params)
		if @car.save
			render json: @car
		else
			render error: { error: "Fail to create user"}, status: 400
		end
	end
end
