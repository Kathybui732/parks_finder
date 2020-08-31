class Park
  attr_reader :name,
              :description,
              :directions,
              :hours

  def initialize(park_params)
    @name = park_params[:name]
    @description = park_params[:description]
    @directions = park_params[:directions]
    @hours = park_params[:hours]
  end
end
