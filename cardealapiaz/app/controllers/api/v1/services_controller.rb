class Api::V1::ServicesController < ApplicationController

	def create
		servicerequest = params['service']

		service = Service.new(
			:time 		=> servicerequest['time'],
			:person 	=> servicerequest['person'],
			:phone 		=> servicerequest['phone'],
			:jobtype	=> servicerequest['jobtype'],
			:car 		=> servicerequest['car']
		)
		service.brand = Brand.find_by(:name => servicerequest['brand'])

		if service.save
			render json: {'status' => '200'}.as_json
		else
			render error: { error: "Fail to create service "}, status: 400
		end
	end

	def show
		if(!(user = tokenAuthorize(params['session'])))
			head(:unauthorized)
			return
		end

		services = Service.where(:brand_id => params[:id])
		render json: services.as_json
	end

end
