class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in, except: [:destroy]

    def new
        @user = User.new
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

    def google_login
        @user = User.find_or_create_by(email: auth_hash[:email]) do |u|
            u.password = SecureRandom.hex
        end

        session[:user_id] = @user.id
        redirect_to user_path(current_user)
    end

    private

    def auth_hash
        request.env['omniauth.auth']['info']
    end

    # def googleAuth
    #     # Get access tokens from the google server
    #     access_token = request.env["omniauth.auth"]
    #     user = User.from_omniauth(access_token)
    #     log_in(user)
    #     # Access_token is used to authenticate request made from the rails application to the google server
    #     user.google_token = access_token.credentials.token
    #     # Refresh_token to request new access_token
    #     # Note: Refresh_token is only sent once during the first request
    #     refresh_token = access_token.credentials.refresh_token
    #     user.google_refresh_token = refresh_token if refresh_token.present?
    #     user.save
    #     redirect_to root_path
    #   end

end