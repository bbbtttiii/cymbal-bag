class BagsController < ApplicationController

    def index
        if params[:user_id]
            @bags = User.find_by(id: params[:user_id]).bags
        else
            @bags = Bag.all
        end
    end

    def show
        @bag = Bag.find_by(params[:id])
    end

    def new
        @bag = Bag.new
    end

    def create
        @bag = Bag.new(bag_params)
        @bag.user = current_user
        @bag.save
        @cymbal = Cymbal.new
        render 'cymbals/new'
    end

    def update

    end

    def destroy
        
    end

    private

    def bag_params
        params.require(:bag).permit(:bag_ids, :id, :name)
    end

end