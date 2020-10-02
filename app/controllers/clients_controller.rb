class ClientsController < ApplicationController

    def index
        @clients = client.all
    end

    def show
        @client = client.find_by(id: params[:workout_id])
    end

    def new
        @client = client.new
        @workout = workout.find_by(id: params[:workout_id])
        # raise params.inspect
    end

    def create
        # raise params.inspect
        @client = client.new(client_params)
        @client.save
        if params[:add] #add more button
            @workout = workout.find_by(id: params[:client][:workout_ids])
            redirect_to new_workout_client_path(@workout)
        else #done button
            redirect_to user_path(@current_user)
        end
    end

    def edit
        @client = client.find_by(id: params[:id])
    end

    def update
        @client = client.find_by(id: params[:id])
        @client.update(client_params)
        if @client.update(client_params)
            redirect_to client_path(@client)
        else
            render 'edit'
        end
    end

    def destroy
        @client = client.find_by(id: params[:id])
        @client.destroy
        redirect_to clients_path
    end

    # def set_client
    #     @client = client.find_by(id: params[:id])
    # end

    private

    def client_params
        params.require(:client).permit(:brand, :line, :cym_model, :cym_type, :diameter, :weight, :finish, :workout_id)
    end

end