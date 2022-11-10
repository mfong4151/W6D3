class UsersController < ApplicationController

    def index
        #users = User.all
        #render plain: "haha im a dummy statement"

        render json: User.all
    end

    def create
        #p 'HEEERRREEEE' , params.to_s
        #"{\"fav_food\"=>\"pizza\", \"user\"=>{\"name\"=>\"Max\", \"email\"=>\"email.com\"}, \"controller\"=>\"users\", \"action\"=>\"create\"}"

        user = User.new(params.require(:user).permit(:name, :email))
        user.save!
        render json: user
    end

    def show

        render json: params
    end

    private

    def user_param
        params.require(:user).permit(:name, :email)
    end
end