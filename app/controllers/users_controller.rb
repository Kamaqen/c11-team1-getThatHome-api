class UsersController < ApplicationController
  skip_before_action :authorize, only: :create

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { token: @user.token }, status: :created # 201
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  # GET /profile
  def show
    render json: current_user
  end

  # PATCH /profile
  def update
    if current_user.update(user_params)
      render json: current_user, status: :ok
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :phone_number, :name, :role)
  end
end