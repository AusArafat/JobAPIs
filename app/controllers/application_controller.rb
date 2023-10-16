class ApplicationController < ActionController::API
  include ExceptionHandler
  prepend_before_action :authorize_request
  load_and_authorize_resource except: [:login, :register]
  def not_found
    render json: {error: "not_found"}
  end

  def authorize_request
    token = request.headers['Authorization']
    token = token&.split(' ').last
    begin
      puts @decoded
      @decoded = JsonWebToken.decode(token)
      @user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end

  end

  def current_user
    #@user
    token = request.headers['Authorization']
    token = token&.split(' ').last
    puts @decoded
    @decoded = JsonWebToken.decode(token)
    @user = User.find(@decoded[:user_id])
  end

end
