class EventsController < ApplicationController
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
        @event.update(event_params)
        redirect_to event_path(@event)
    end
    def new
        @event = Event.new
    end
    def create
        @event = Event.create(event_params)
        redirect_to event_path(@event)
    end
    private 
        def event_params
             params.require(:event).permit(:name, :description, :location, :price, :starts_at, :image_file_name, :capacity )
        end

end
