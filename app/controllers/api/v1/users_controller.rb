class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render status: 200, json: users
  end

  def show
    @user = User.find(params[:id])

    render status: 200, json: @user
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render status: 201, json: @user
    else
      render status: 400, json: { error: "Bad Request" }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :tel).merge(password: params[:password], password_confirmation: params[:password_confirmation])
  end
end
