class Api::V1::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
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
