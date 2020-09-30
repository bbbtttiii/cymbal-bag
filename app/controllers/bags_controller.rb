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
        if params[:cymbal_id]
            @cymbal = Cymbal.find_by(id: params[:cymbal_id])
            @bag = @cymbal.bag.build
        else
            @bag = Bag.new
            @bag.build_cymbal
        end
    end


    def create
        bag = Bag.new(bag_params)
        bag.user = current_user
        bag.cymbal_id = params[:cymbal_id]
        bag.save
        redirect_to bag_path(bag.item)
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