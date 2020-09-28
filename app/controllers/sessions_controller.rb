class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:username])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def destroy
        session.delete("user_id")
        redirect_to root_path
    end

    def create_with_fb
        user = User.find_or_create_by(username: auth["email"]) do |u|
            u.password = 'password'
        end
        user.save
        session[:user_id] = user.id
        redirect_to root_path
    end

    def auth
        request.env['omniauth.auth']
    end

end