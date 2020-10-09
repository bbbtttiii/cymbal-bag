class FavoritesController < ApplicationController

    def new
        @cymbal = Cymbal.find_by(id: params[:cymbal_id])
        @favorite = Favorite.new
        @favorite.cymbal = @cymbal
    end

    def edit
        @favorite = Favorite.find_by(id: params[:id])
    end

    def create
        @favorite = Favorite.new(favorite_params)
        @favorite.user = @current_user
        @cymbal_id = params[:favorite][:cymbal_id].to_i
        if !@current_user.cymbal_ids.include?(@cymbal_id)
            if @favorite.save
                redirect_to user_path(@current_user)
            end
        else
            @already_have = "You already have this saved!"
            render 'new'
        end
    end

    def update
        @favorite = Favorite.find_by(id: params[:id])
        @favorite.update(favorite_params)
        if @favorite.update(favorite_params)
            redirect_to user_path(@current_user)
        else
            render 'edit'
        end
    end

    def destroy
        @favorite = Favorite.find_by(id: params[:id])
        @favorite.destroy
        redirect_to user_path(@current_user)
    end

    private

    def favorite_params
        params.require(:favorite).permit(:name, :cymbal_id)
    end

end