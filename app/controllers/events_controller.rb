class EventsController < ApplicationController
  def index
    @events = Event.all
    @json = Event.all.to_gmaps4rails
    
    @markers = '['
    @events.each do |event|

      @markers = @markers + '{"description": "' + event.description + '",
      "title": "' + event.name + '",
      "sidebar": "",
      "lng": "' + event.longitude.to_s + '",
      "lat": "' + event.latitude.to_s + '",
      "picture": "",
      "width": "",
      "height": ""},'
    end
    @markers = @markers.chop + ']'
	        
  end

  def show
  	  	
    @event = Event.find(params[:id])
    @json = Event.find(params[:id]).to_gmaps4rails
    @markers = Event.find(params[:id]).to_gmaps4rails
    
    m = @markers.split","
    
  	@markers = m[0] + ",\"title\": \"#{@event.name}\"," + "\"description\": \"#{@event.name} - #{@event.description}\"," + m[1]
    
    def gmaps4rails_infowindow
      "#{Event.name}"
    end
    
    def gmaps4rails_title
      "#{Event.name}"
    end
    
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to @event, :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to @event, :notice  => "Successfully updated event."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url, :notice => "Successfully destroyed event."
  end
end
