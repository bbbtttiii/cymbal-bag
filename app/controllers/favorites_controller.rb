class FavoritesController < ApplicationController

    def index
        @favorites = Favorite.all
    end

    def show
        @favorite = Favorite.find_by(id: params[:id])
    end

    def new
        # byebug
        @cymbal = Cymbal.find_by(id: params[:cymbal_id])
        @favorite = Favorite.new
    end

    def edit
        @favorite = Favorite.find_by(id: params[:id])
    end

    def create
        @favorite = Favorite.new(favorite_params)
        # byebug
        @favorite.user = @current_user
        @cymbal_id = params[:favorite][:cymbal_id].to_i
        if !@current_user.cymbal_ids.include?(@cymbal_id) 
            # byebug
            if @favorite.save
                redirect_to user_path(@current_user)
            end
        else
            #error msg: you already have that cymbal
            redirect_to new_cymbal_favorite_path(@cymbal_id)
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
        params.require(:favorite).permit(:name, :cymbal_id)
    end

end