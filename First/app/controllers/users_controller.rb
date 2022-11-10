class UsersController < ApplicationController

    def index
        #users = User.all
        #render plain: "haha im a dummy statement"

        render json: User.all
    end

    def create
        user = User.new(user_params)
        if user.save!
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        render json: user 
    end

    def show
        user = User.find_by(:id params[:id])
        render json: user
    end

    def update
        user = User.find_by(:id params[:id])

        if user.update(user_params)
            redirect_to user_url(user.id)
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end