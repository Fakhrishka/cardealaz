class TestDrive < ApplicationRecord
	belongs_to :car

	def self.showTestDrive(id)
		uri = URI('http://localhost:3000/api/v1/test_drives/' + id.to_s)

		# params = { :email => cookie[:email], :token => cookie[:token] }
		# uri.query = URI.encode_www_form(params)	

		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)
		return ActiveSupport::JSON.decode(jsresponse)
	end
end
