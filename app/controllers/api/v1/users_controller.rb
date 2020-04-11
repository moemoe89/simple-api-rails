module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorize_request
      before_action :find_user, except: %i[create index]

      def index
        @users = User.all
        render json: { success: true, messages: ['Successfully retrieved list data'], data: @users }, status: :ok
      end

      def show
        render json: { success: true, messages: ['Successfully retrieved data'], data: @user }, status: :ok
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: { success: true, messages: ['Successfully created data'], data: @user }, status: :created
        else
          render json: { success: false, messages: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: { success: true, messages: ['Successfully updated data'], data: @user }, status: :ok
        else  
          render json: { success: false, messages: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @user.destroy
          render json: { success: true, messages: ['Successfully deleted data'], data: @user }, status: :ok
        else
          render json: { success: false, messages: ['Failed deleted data'] }, status: :internal_server_error
        end
      end

      private

      def find_user
        @user = User.find(params[:_id])
        rescue ActiveRecord::RecordNotFound
          render json: { success: false, messages: ['User not found'] }, status: :not_found
      end

      def user_params
        params.permit(
          :name, :email, :phone, :address, :password, :password_confirmation
        )
      end
    end
  end
end