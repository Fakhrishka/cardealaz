class Api::V1::TestDrivesController < ApplicationController
	
	def show
		tdrives = TestDrive.where(:brand_id => params[:id])
		render json: tdrives.as_json
	end

end
