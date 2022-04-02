class Api::V1::SearchRestaurantsController < ApplicationController
	require 'httpclient'

	CLIENT = HTTPClient.new()
	GOURMET_BASE_URL = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key="
	CODE_BASE_URL = "https://webservice.recruit.co.jp/hotpepper/genre/v1/?key="

  def get_restaurant
		query_paarms = "&small_area=XA3T&format=json"
		request_url = GOURMET_BASE_URL + ENV['HOTPEPPER_API_KEY'] + query_paarms

		response = get_request(request_url)

		render status: 200, json: response
  end

	def get_restaurant_with_code
		query_paarms = "&middle_area=Y030&format=json"
		genre_code = get_code(params[:code])[0]
		query_code = "&genre=#{genre_code}"

		request_url = GOURMET_BASE_URL + ENV['HOTPEPPER_API_KEY'] + query_paarms + query_code
		response = get_request(request_url)
		
		render status: 200, json: response
	end

	private

	def get_code(genre_code)
		query_paarms = "&format=json&code=#{genre_code}"
		request_url = CODE_BASE_URL + ENV['HOTPEPPER_API_KEY'] + query_paarms

		response = get_request(request_url)
		result = response["results"]["genre"] 

		@code = result.map do |res|
			res["code"]
		end

		@code
	end


	def get_request(request_url)
		response = CLIENT.get(request_url)
		parsed_response = JSON.parse(response.body)

		return parsed_response
	end
end
