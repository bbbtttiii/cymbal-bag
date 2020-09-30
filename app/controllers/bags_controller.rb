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
        if params[:name]
            #this bag name is taken
            redirect_to new_bag_path
        else
            @bag = Bag.new
        end
    end

    def create
        @bag = Bag.new(bag_params)
        @bag.user = current_user
        @bag.save
        redirect_to new_cymbal_path
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