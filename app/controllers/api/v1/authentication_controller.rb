module Api
  module V1
    class AuthenticationController < ApplicationController
      before_action :authorize_request, except: :login

      def login
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i
          render json: { success: true, messages: ['Successfully logged in'], data: { token: token, exp: time.strftime("%m-%d-%Y %H:%M") } }, status: :ok
        else
          render json: { success: false, messages: ['Invalid email or password'] }, status: :unauthorized
        end
      end

      private

      def login_params
        params.permit(:email, :password)
      end
    end
  end
end