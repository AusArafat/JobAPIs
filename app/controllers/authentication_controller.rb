class AuthenticationController < ApplicationController
  before_action :authorize_request, except: [:login, :register]

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 3.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     email: @user.email }, status: :ok
    else
      render json: { error: 'Incorrect Username/Password' }, status: :unauthorized
    end
  end

  def register
    @new_user = User.new(login_params)
    if @new_user.save
      render json: { "RecordStatus": "User Created"}, status: :ok
    else
      render json: @new_user.errors, status: :unprocessable_entity
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
