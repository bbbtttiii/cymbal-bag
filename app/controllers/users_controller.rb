class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect to '/'
        else
            render 'new'
        end
    end

    private

    def user_params

    end

end
