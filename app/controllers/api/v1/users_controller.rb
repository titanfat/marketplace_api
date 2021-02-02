class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  def show
    render json: @user
  end

  def destroy
    @user.destroy
    head 204
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: create
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
