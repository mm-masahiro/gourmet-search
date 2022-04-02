class Api::V1::SearchRestaurantsController < ApplicationController
	require 'httpclient'

	CLIENT = HTTPClient.new()
	GOURMET_BASE_URL = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key="
	CODE_BASE_URL = "https://webservice.recruit.co.jp/hotpepper/genre/v1/?key="

  def get_restaurant
		query_paarms = "&small_area=XA3T&format=json"
		request_url = GOURMET_BASE_URL + ENV['HOTPEPPER_API_KEY'] + query_paarms

		response = CLIENT.get(request_url)
		parsed_response = JSON.parse(response.body)

		render status: 200, json: parsed_response
  end

	def get_code
		query_paarms = "&format=json&code=#{params[:code]}"
		request_url = CODE_BASE_URL + ENV['HOTPEPPER_API_KEY'] + query_paarms

		response = CLIENT.get(request_url)
		parsed_response = JSON.parse(response.body)

		render status: 200, json: parsed_response["results"]["genre"]
	end
end
