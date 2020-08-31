class ParksController < ApplicationController
  def index
    @parks = ParkResults.new.find_parks(params[:state])
  end
end

class ParkService
  def conn
    Faraday.new 'https://developer.nps.gov' do |f|
      f.params['api_key'] = ENV['PARK_API_KEY']
    end
  end

  def find_parks(state)
    response = conn.get "/api/v1/parks?stateCode=#{state}"
    JSON.parse(response.body)
  end
end

class ParkResults
  def find_parks(state)
    park_service_data.find_parks(state)['data'].map do |park_data|
      Park.new(park_data)
    end
  end

  def park_service_data
    ParkService.new
  end
end

class Park
  attr_reader :name, :description, :directions, :hours

  def initialize(park_params)
    @name = park_params['name']
    @description = park_params['description']
    @directions = park_params['directionsInfo']
    @hours = park_params['operatingHours'].first['standardHours']
  end
end
