class MapsController < ApplicationController

  def new
    @map = Map.new
    puts params
    @temp = params[:temp]
    puts @temp
  end

  def create
    city = params[:map][:city]
    begin
      weather = RestClient.get( 
        "https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&APPID=443eeaabd7d5e46a4af230a0803b9021", 
        :content_type => :json, :accept => :json)
      weather = JSON.parse(weather)
      temp = "The temperature in #{city} is " + weather['main']['temp'].to_s
    rescue => e 
      temp = 'error please try again :('
      puts e
    end
    redirect_to :action => "new", :temp=> temp
  end

end
