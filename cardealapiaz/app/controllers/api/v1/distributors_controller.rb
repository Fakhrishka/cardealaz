class Api::V1::DistributorsController < ApplicationController
	def index
		@distributors = Distributor.all
		render json: @distributors
	end

	def show
		@distributor = Distributor.find(params[:id])
		render json: @distributor
	end

	def create
		@distributor = Distributor.new(distributor_params)
		if @distributor.save
			render json: @distributor
		else
			render error: { error: "Fail to create user"}, status: 400
		end
	end

	def update
		@distributor = Distributor.find(params[:id])
		if @distributor
			@distributor.update(distributor_params)
			render json: { message: "Succesfully updated"}, status: 200
		else
			render json: { error: "No update Distributor"}, status: 400
		end
	end

	def destroy
		@distributor = Distributor.find(params[:id])
		if @distributor
			@distributor.destroy
			render json: { message: "Deleted"}, status: 200
		else
			render json: { error: "Delete fail"}, status: 400
		end
	end


	private

	def distributor_params()
		params.require(:distributor).permit(:name, :address)
	end
end
