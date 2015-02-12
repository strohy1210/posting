class EventsController < ApplicationController
  def new
    @event= Event.new
  end

  def create
    Event.create(event_params)
    title = Event.last.title
    flash[:success] =  "event: "+title+' posted to all the medias!'
    redirect_to :back
  end

  private
    def event_params
      params.require(:event).permit!
    end
end
