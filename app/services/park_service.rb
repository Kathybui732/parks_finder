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
