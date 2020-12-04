class AuthController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        if !user
            render json: {message: "No user by that name."}
        else
            # Now check Password
            if user.authenticate(params[:password])
                render json: { message: "Success", username: user.username, id: user.id}
            else
                render json: {message: "Invalid username and password"}
            end
        end
    end
end