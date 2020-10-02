class DrumsController < ApplicationController

    def index
        @drums = Drum.all
    end

    def show
        @drum = Drum.find_by(id: params[:bag_id])
    end

    def new
        @drum = Drum.new
        @bag = Bag.find_by(id: params[:bag_id])
        # raise params.inspect
    end

    def create
        # raise params.inspect
        @drum = Drum.new(drum_params)
        @drum.save
        # if params[:add] #add more button
        #     @bag = Bag.find_by(id: params[:drum][:bag_ids])
            # redirect_to new_bag_drum_path(@bag)
        # else #done button
            redirect_to user_path(@current_user)
        # end
    end

    def edit
        @drum = Drum.find_by(id: params[:id])
    end

    def update
        @drum = Drum.find_by(id: params[:id])
        @drum.update(drum_params)
        if @drum.update(drum_params)
            redirect_to drum_path(@drum)
        else
            render 'edit'
        end
    end

    def destroy
        @drum = Drum.find_by(id: params[:id])
        @drum.destroy
        redirect_to drums_path
    end

    # def set_drum
    #     @drum = Drum.find_by(id: params[:id])
    # end

    private

    def drum_params
        params.require(:drum).permit(:brand, :drum_model, :diameter, :depth, :material, :hoops, :heads, :wires)
    end

end