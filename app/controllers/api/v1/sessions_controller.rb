class Api::V1::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      log_in user
      render status: 200
    else
      rendere status: 400, json: { error: "occured error" }
    end
  end
  
  def destroy
    log_out
    render status: 200
  end
end
