class UsersController < ApplicationController
    skip_before_action :current_user, only: [:create]
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        @user = @current_user
        @user = User.find_by(params[:id])
        # byebug
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :username, :id)
    end

end
