class Api::V1::BrandsController < ApplicationController
	def index
		@brands = Brand.all
		render json: @brands
	end

	def show
		if params[:name]
			@brand = Brand.find_by(:name => params[:name].downcase)
		else
			@brand = Brand.find(params[:id])
		end

		puts params.inspect
		render json: @brand
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