class AuthController < ApplicationController
  def signup
    user = User.new(user_params)
    if user.save
      token = generate_jwt_token(user)
      render json: { token: token, user: user }, status: :created
    else
      render json: { errors: @user.errors.full_messages },  status: :unprocessable_entity
    end
  end
  
  def login
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      token = generate_jwt_token(user)
      render json: { token: token, user: user }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end

  def generate_jwt_token(user)
    JsonWebToken.encode({ id: user.id }, 24.hours.from_now.to_i)
    rescue JWT::EncodeError
  end
end
