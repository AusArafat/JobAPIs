# frozen_string_literal: true

module ExceptionHandler extend ActiveSupport::Concern

included do
  rescue_from CanCan::AccessDenied do |e|
    render json: { Error: "You are not authorized to access this resource", User: current_user[:email]}, status: :unauthorized
  end
  end
end
