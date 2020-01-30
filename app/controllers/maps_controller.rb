class MapsController < ApplicationController

  def index
    @maps = Map.all
  end

  def new
  end
  
end
