class TestDrivesController < ApplicationController

	def new
  		@tdrive = TestDrive.new
	end

	def show
		@tdrives = TestDrive.showTestDrive(params[:id])
	end

	def create
		puts params.inspect
		redirect_to root_path
	end


end
