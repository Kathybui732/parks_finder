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
