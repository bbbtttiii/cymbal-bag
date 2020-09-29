class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in, except: [:destroy]

    def new
        # @user = User.new
    end

    def create
        # raise params.inspect
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render 'new'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create_with_fb
        @user = User.find_or_create_by(username: auth["email"]) do |u|
            u.password = 'password'
        end
        @user.save
        session[:user_id] = @user.id
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end