class Api::V1::CarsController < ApplicationController
	def index
		# cars = Car.all
		# render json: cars

		filtredcars = {}
		Brand.all.each do |brand|
			cars = []
			Car.where(:brand_id => brand.id).each do |objcar|
				arrcar = objcar.attributes
				if !objcar.car_datas.empty?
					arrcar['startprice'] = objcar.car_datas.minimum(:price)
					cars << arrcar
				end
			end
			filtredcars[brand.name] = cars
		end

		render json: filtredcars


		# render json: cars.map { |car| [Brand.find_by(:id => car.id).name, car]}
	end

	def mycars
		# Function to check if user is logged in and authorized
		if(!(user = tokenAuthorize(params)))
			head(:unauthorized)
			return
		end

		brand = Brand.find_by(:user_id => user[:id])
		render json: brand.cars.as_json
	end


	def new
		@car = Car.new
	end

	# GET /cars
	def show
		car = Car.find(params[:id])
		cardatas = []
		car.car_datas.each do |cardata|
			cardatas << cardata
		end

		render json: cardatas.as_json
	end

	def destroy
		if(!(user = tokenAuthorize(params['session'])))
			head(:unauthorized)
			return
		end

		car.destroy
		respond_to do |format|
			format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
			format.json { head :no_content }
    	end
	end


	# POST /cars
	def create
		if(!(user = tokenAuthorize(params['session'])))
			head(:unauthorized)
			return
		end
		puts params.inspect

		carrequest = params['car']

		car = Car.new(:model => carrequest['model'], :test_drive => carrequest['test_drive'])
		car.brand = Brand.find(params['car']['brand_id'])

		if car.save
			render json: {'status' => '200'}.as_json
		else
			render error: { error: "Fail to create user"}, status: 400
		end
	end

	def car_params
		puts params
		params.permit(:brand_id, :model, :test_drive)
    end
end
