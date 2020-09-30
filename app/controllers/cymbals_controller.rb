class CymbalsController < ApplicationController

    def index
        if params[:user_id]
            @cymbals = User.find_by(id: params[:user_id]).items
        else
            @cymbals = Cymbal.all
        end
    end

    def show
    end

    def new
        @cymbal = Cymbal.new
        @cymbal.bags.build(user: current_user)
    end

    def create
        @cymbal = Cymbal.create(cymbal_params)
        if @cymbal.save
            redirect_to cymbal_path(@cymbal)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @cymbal.update(cymbal_params)
            redirect_to cymbal_path(@cymbal)
        else
            render 'edit'
        end
    end

    def destroy

    end

    def set_cymbal
        @cymbal = Cymbal.find_by(id: params[:id])
    end

    private

    def cymbals_params
        # params.require(:cymbal).permit()
    end

end