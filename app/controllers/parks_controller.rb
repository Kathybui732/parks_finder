class ParksController < ApplicationController
  def index
    @parks = ParkResults.new.find_parks(params[:state])
  end
end
