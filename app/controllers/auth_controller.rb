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
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
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
    JWT.encode({ id: user.id })
    rescue JWT::EncodeError
  end
end
