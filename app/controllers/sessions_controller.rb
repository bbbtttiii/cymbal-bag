class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in, except: [:destroy]

    def new
        # @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create_with_fb
        # raise params.inspect
        @user = User.find_or_create_by(u_id: auth['u_id']) {|u| u.password = 'password' }
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end