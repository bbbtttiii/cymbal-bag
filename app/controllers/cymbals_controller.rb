class CymbalsController < ApplicationController

    def index
        @cymbals = Cymbal.date_sorted.size_sorted
    end

    def rides
        @cymbals = Cymbal.where(cym_type: "Ride")
    end

    def show
        @cymbal = Cymbal.find_by(id: params[:id])
    end

    def new
        @cymbal = Cymbal.new
        @favorite = @cymbal.favorites.build
    end

    def create
        @cymbal = Cymbal.new(cymbal_params)
        @cymbal.user_ids << @current_user.id
        @cymbal.favorites.last.user_id = @current_user.id
        if @cymbal.save
            @cymbal.favorites.last.cymbal_id =  @cymbal.id
            @cymbal.favorites.last.save
            redirect_to user_path(@current_user)
        else
            render 'new'
        end
    end

    def edit
        @cymbal = Cymbal.find_by(id: params[:id])
        @favorite = Favorite.find_by(id: params[:favorite_id])
    end

    def update
        @cymbal = Cymbal.find_by(id: params[:id])
        if @cymbal.update(cymbal_params)
            redirect_to user_path(@current_user)
        else
            render 'edit'
        end
    end

    def destroy
        @cymbal = Cymbal.find_by(id: params[:id])
        @cymbal.destroy
        redirect_to cymbals_path
    end

    private

    def cymbal_params
        params.require(:cymbal).permit(:brand, :line, :cym_model, :cym_type, :diameter, :weight, :finish, favorites_attributes: [:name])
    end

end