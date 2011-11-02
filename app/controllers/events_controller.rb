class EventsController < ApplicationController
  def index
    @events = Event.all
    @json = Event.all.to_gmaps4rails
    
    data_string = String.new
    data_string = "[{"
    @markers = data_string
    
    for event in @events
    	@markers = @markers + "\"description\": \"#{@events.description}\", " + '"title": "", "sidebar": "", "lng": "\"#{@events.longitude}\"", "lat": "34.2027252", "picture": "", "width": "", "height": ""}]'
    	    	
	end
    	
        
  end

  def show
  	  	
    @event = Event.find(params[:id])
    @json = Event.find(params[:id]).to_gmaps4rails
    @markers = Event.find(params[:id]).to_gmaps4rails
    
    m = @markers.split","
    
  	@markers = m[0] + ",\"title\": \"#{@event.name}\"," + "\"description\": \"#{@event.name} - #{@event.description}\"," + m[1]
    
    puts "***"+@markers.class.to_s
    
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
