class EventsController < ApplicationController
    before_action :authenticate_user!,except: [:index,:show]


def index 
    @events=Event.all.order("created_at DESC")
end

def show
  @event = Event.find(params[:id])
rescue ActiveRecord::RecordNotFound
  redirect_to root_url
end

def new
  @event=current_user.created_events.build
end

def create
  @event=current_user.created_events.build(event_params)
  if @event.save
    redirect_to root_path
  else
  render :new, status: :unprocessable_entity
  end
end



private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title,:body,:date)
    end
end
