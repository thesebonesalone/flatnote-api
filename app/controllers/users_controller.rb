require 'byebug'

class UsersController < ApplicationController
    def create
        # byebug
        if user = User.create(user_params)
            render :json => user
        else
            render :json => {error: "Unable to create User"}
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
            params.require(:user).permit(:username)
        end

end
