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
        @bag = Bag.new(bag_params)
        # bag.user = current_user
        # bag.cymbal_id = params[:cymbal_id]
        # bag.save
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