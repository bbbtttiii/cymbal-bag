class BagsController < ApplicationController

    def index
        if params[:user_id]
            @bags = User.find_by(id: params[:user_id]).bags
        else
            @bags = Bag.all
        end
    end

    def show
        @bags = Bag.find_by(params[:id])
    end

    def new
        @bag = Bag.new
    end

    def create
        bag = Bag.new(bag_params)
        if bag.save
            redirect_to bag
        else
            redirect_to bags_path
        end
    end

    def update

    end

    def destroy
        
    end

    private

    def bag_params
        params.require(:bag).permit(:name, :user_id)
    end

end