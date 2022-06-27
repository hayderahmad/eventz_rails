class EventsController < ApplicationController
    before_action :require_signin, except: [:index, :show]
    before_action :require_admin, except: [:index, :show]
    def index
        @events = Event.upcoming
    end
    def show
        @event = Event.find(params[:id])
    end
    def edit
        @event = Event.find(params[:id])
    end
    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to root_path
    end
    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            redirect_to event_path(@event), notice: "Event successfully updated!" 
        else
            render :edit
        end
    end
    def new
        @event = Event.new
    end
    def create
        @event =Event.new(event_params)
        if @event.save
            redirect_to event_path(@event), notice: "Event successfully created!"
        else
            render :new
        end
    end
    private 
        def event_params
             params.require(:event).permit(:name, :description, :location, :price, :starts_at, :image_file_name, :capacity )
        end

end
