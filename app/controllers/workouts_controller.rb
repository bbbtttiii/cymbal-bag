class WorkoutsController < ApplicationController

    def index
        @workouts = workout.all
    end

    def show
        @workout = workout.find_by(id: params[:id])
    end

    def new
        @workout = workout.new
    end

    def edit
        @workout = workout.find_by(id: params[:id])
    end

    def create
        @workout = workout.new(workout_params)
        @workout.user = @current_user
        @workout.save
        if @workout.save
            @client = client.new
            redirect_to new_workout_client_path(@workout)
        else
            render 'new'
        end
    end

    def update
        @workout = workout.find_by(id: params[:id])
        @workout.update(workout_params)
        if @workout.update(workout_params)
            redirect_to user_path
        else
            render 'edit'
        end
    end

    def destroy
        #make sure belongs to user
        @workout = workout.find_by(id: params[:id])
        @workout.destroy
        redirect_to user_path
    end

    private

    def workout_params
        params.require(:workout).permit(:name, :workout_id, :user_id, :client_id, :id)
    end

end