class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find_by(id: params[:id])
    end

    def new
        @review = Review.new
    end

    def edit
        @review = Review.find_by(id: params[:id])
    end

    def create
        @review = Review.new(review_params)
        @review.user = @current_user
        @review.save
        if @review.save
            @cymbal = Cymbal.new
            redirect_to new_review_cymbal_path(@review)
        else
            render 'new'
        end
    end

    def update
        @review = Review.find_by(id: params[:id])
        @review.update(review_params)
        if @review.update(review_params)
            redirect_to user_path(@current_user)
        else
            render 'edit'
        end
    end

    def destroy
        #make sure belongs to user
        @review = Review.find_by(id: params[:id])
        @review.destroy
        redirect_to user_path
    end

    private

    def review_params
        params.require(:review).permit(:name, :review_id, :user_id, :cymbal_id, :id)
    end

end