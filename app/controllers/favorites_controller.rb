class FavoritesController < ApplicationController

    def index
        @favorites = Favorite.all
    end

    def show
        @favorite = Favorite.find_by(id: params[:id])
    end

    def new
        @favorite = Favorite.new
    end

    def edit
        @favorite = Favorite.find_by(id: params[:id])
    end

    def create
        @favorite = Favorite.new(favorite_params)
        @favorite.user = @current_user
        @favorite.save
        if @favorite.save
            @cymbal = Cymbal.new
            redirect_to new_favorite_cymbal_path(@favorite)
        else
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
        #make sure belongs to user
        @favorite = Favorite.find_by(id: params[:id])
        @favorite.destroy
        redirect_to user_path(@current_user)
    end

    private

    def favorite_params
        params.require(:favorite).permit(:name, :favorite_id, :user_id, :cymbal_id, :id)
    end

end