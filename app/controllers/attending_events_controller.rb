class AttendingEventsController < ApplicationController
    def new
        @event = Event.find(params[:id])
    end

    def create
        @event = Event.find(params[:id])
        @event.attendees << current_user
        flash[:notice] = 'You have registered for this event.'
        redirect_to root_path
    end
end
