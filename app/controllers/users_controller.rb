require 'byebug'

class UsersController < ApplicationController
    def create
        
        user = User.new(user_params)
        if user.save  
            render :json => {user: user, message: "Success"}
        else
            render :json => {message: "Unable to create User"}
        end
        
    end

    def update
    end

    def show
            user = User.where(username: params[:id])
            render :json => user
    end

    def getnotes
        user = User.where(username: params[:username])
        notes = Note.where(user: user)
        render :json => notes
    end

    private
        def user_params
            params.require(:user).permit(:username, :password)
        end

end
