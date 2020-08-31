class Park
  attr_reader :name, :description, :directions, :hours

  def initialize(park_params)
    @name = park_params['fullName']
    @description = park_params['description']
    @directions = park_params['directionsInfo']
    @hours = park_params['operatingHours'].first['standardHours']
  end
end
