class UsersController < ApplicationController
    before_action :require_signin, except: [:new, :create]
    before_action :require_correct_user, only: [:edit, :update, :destroy]
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
        @registrations = @user.registrations
        @liked_events = @user.liked_events
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(users_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user),
            notice: "Thank you for signing up!"
        else
            render :new
        end
    end
    def edit
    end
    def update
        if @user.update(users_params)
            redirect_to user_path(@user),
            notice: "successfully updated!"
        else
            render :edit
        end
    end
    def destroy
        @user.destroy
        session[:user_id]= nil
        redirect_to users_path
    end
    private
        def require_correct_user
            @user = User.find(params[:id])
            unless session[:user_id] == @user.id
                redirect_to events_path
            end
        end
        def users_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
