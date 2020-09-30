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
        # @cymbal = @bag.build_cymbal
    end

    def create
        # byebug
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
        params.require(:bag).permit(:name, :bag_id, :user_id, :cymbal_id, :id)
    end

end