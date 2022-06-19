class EventsController < ApplicationController
    def index
        @events = ["BugSmash", "Hakathon", "kataCamp", "Rails User Group"]
    end
end
