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
    end

    def create
        byebug
        @bag = Bag.new(bag_params)
        @bag.user = @current_user
        @cymbal = Cymbal.new
        redirect_to user_bags_path(@bag)
        # if @bag.save
        #     redirect_to user_bags_path(@bag)
        # else
        #     render 'new'
        # end

    end

    def update

    end

    def destroy
        @bag.destroy
        redirect_to user_bags_path
    end

    private

    def bag_params
        params.require(:bag).permit(:name, :bag_id, :user_id, :cymbal_id, :id)
    end

end