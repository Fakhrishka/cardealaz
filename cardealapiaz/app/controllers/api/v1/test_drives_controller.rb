class Api::V1::TestDrivesController < ApplicationController
	
	def show
		if(!(user = tokenAuthorize(params['session'])))
			head(:unauthorized)
			return
		end

		tdrives = TestDrive.where(:brand_id => params[:id])
		render json: tdrives.as_json
	end

end
