class BagsController < ApplicationController

    def index
        if params[:id]
            @bags = User.find_by(id: params[:id]).bags
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
        redirect_to bags_path(@bag)
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