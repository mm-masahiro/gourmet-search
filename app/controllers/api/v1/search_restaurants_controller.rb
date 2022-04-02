class Api::V1::SearchRestaurantsController < ApplicationController
	require 'httpclient'

	BASE_URL = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key="

  def index
		client = HTTPClient.new()
		query_paarms = "&small_area=XA3T&format=json"
		request_url = BASE_URL + ENV['HOTPEPPER_API_KEY'] + query_paarms

		response = client.get(request_url)
		parsed_response = JSON.parse(response.body)

		render status: 200, json: parsed_response
  end
end
