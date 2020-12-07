require 'byebug'

class UsersController < ApplicationController
    def create

        user = User.find_by(username: user_params[:username])
        # byebug
        if user === nil
            user = User.new(user_params)
            if user.save
                render :json => {username: user.username, id: user.id, notes: notes, message: "Success"}
            else
                render :json => {message: "Unable to create User"}
            end
        else
            notes = Note.where(user: user)
            render json: { message: "Success", username: user.username, id: user.id, notes: notes}
            
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
