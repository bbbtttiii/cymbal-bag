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

        @bag = Bag.new(bag_params)
        @bag.user = @current_user
        @bag.save
        @cymbal = Cymbal.new
        # byebug
        redirect_to user_bags_path(@current_user)
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