class Event < ActiveRecord::Base
  attr_accessible :name, :address, :latitude, :longitude, :gmaps, :start, :start_time, :description, :info_url
  geocoded_by :address
  after_validation :geocode
  
  acts_as_gmappable

    def gmaps4rails_address
    	address 
    end
  
    def title
    	self.name
    end
end
