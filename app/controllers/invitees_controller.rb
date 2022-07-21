class InviteesController < ApplicationController

def new
    @event = Event.find(params[:id])
        @invitee = current_user.invitees.build
  end

  def create
    @event = Event.find(params[:id])
    @invitee = current_user.invitees.build
    @invitee.attended_event = @event
    if @invitee.save
      redirect_to @event
    else
        redirect_to event_path(@event), status: :unprocessable_entity
    end
  end
  

end
