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
        # byebug
        if @bag.save
            @cymbal = Cymbal.new
            redirect_to new_cymbal_path(@current_user)
        else
            render 'new'
        end
    end

    def update

    end

    def destroy
        @bag.user = @current.user
        @bag.destroy
        redirect_to user_bags_path(@current_user)
    end

    private

    def bag_params
        params.require(:bag).permit(:name, :bag_id, :user_id, :cymbal_id, :id)
    end

end