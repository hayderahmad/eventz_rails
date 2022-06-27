class SessionsController < ApplicationController
    def new
    end
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user), notice: "Welcome back, #{user.name}!"
            # redirect_to session[:intended_url], notice: "Welcome back, #{user.name}!"
            # session[:intended_url] = nil
        else
            flash.now[:alert] = "Invalid email/password combination"
            render :new
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to events_path, notice: "successfully signd out"
    end
end
