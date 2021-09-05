class BrandsController < ApplicationController
	before_action :requiredata


# nethttp.rb
	def index
		@brands = Brand.getAllBrands
	end
	
	def show
	end

	def new
		@brand = Brand.new
	end

	# post
	def create
	end

	private

	def requiredata
		require 'json'
		require 'uri'
		require 'net/http'
	end
end
