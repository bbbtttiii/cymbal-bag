class CymbalsController < ApplicationController

    def index
        @cymbals = Cymbal.all
    end

    def show
        @cymbal = Cymbal.find_by(id: params[:id])
    end

    def new
        @cymbal = Cymbal.new
    end

    def create
        @cymbal = Cymbal.create(cymbal_params)
        if params[:add] #add more button
            render 'cymbals/new'
        else #done button
            redirect_to user_path(@current_user)
        end
    end

    def edit
    end

    def update
        if @cymbal.update(cymbal_params)
            redirect_to cymbal_path(@cymbal)
        else
            render 'edit'
        end
    end

    def destroy
        @cymbal = Cymbal.find_by(id: params[:id])
        @cymbal.destroy
        redirect_to cymbals_path
    end

    # def set_cymbal
    #     @cymbal = Cymbal.find_by(id: params[:id])
    # end

    private

    def cymbal_params
        params.permit(:brand, :line, :cym_model, :cym_type, :diameter, :weight, :finish)
    end

end