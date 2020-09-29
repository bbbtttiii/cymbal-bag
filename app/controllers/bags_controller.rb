class BagsController < ApplicationController

    def index
        if params[:user_id]
            @bags = User.find_by(id: params[:user_id]).bags
        else
            @bags = Bags.all
        end
    end

    def show

    end

    def new
        @bag = Bag.new
    end

    def create
        
    end

    def update

    end

    def destroy

    end

    private

    def bags_params

    end

end