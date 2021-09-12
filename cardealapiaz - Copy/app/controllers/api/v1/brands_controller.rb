class Api::V1::BrandsController < ApplicationController
	def index
		@brands = Brand.all
		render json: @brands
	end

	def getCarsByBrand
		brand = Brand.find_by(:id => params[:id])
		puts brand.cars

		render json: brand.cars.as_json
	end

	def show
		if params[:name]
			brand = Brand.find_by(:name => params[:name].downcase)
		else
			brand = Brand.find(params[:id])
		end

		brand_data = 
		{
			'brandinfo' => brand,
			'brandcars' => brand.cars
		}

		puts params.inspect
		render json: brand_data.as_json
	end

	def create
		@brand = Brand.new(brand_params)
		if @brand.save
			render json: @brand
		else
			render error: { error: "Fail to create user"}, status: 400
		end
	end

	def update
		@brand = Distributor.find(params[:id])
		if @brand
			@brand.update(brand_params)
			render json: { message: "Succesfully updated"}, status: 200
		else
			render json: { error: "No update brand"}, status: 400
		end
	end

	def destroy
		@brand = Brand.find(params[:id])
		if @brand
			@brand.destroy
			render json: { message: "Deleted"}, status: 200
		else
			render json: { error: "Delete fail"}, status: 400
		end
	end


	private

	def brand_params()
		params.require(:brand).permit(:name, :distributor_id)
	end
end