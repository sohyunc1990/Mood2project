

class Destination < ApplicationRecord
  has_many :trips
  has_many :users, through: :trips
  has_many :attractions

  def self.sort_alphabetically
    self.all.order(:city)
  end

  def api_data
    url = URI("https://us-weather-by-city.p.rapidapi.com/getweather?city=#{self.city}&state=#{self.state}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'us-weather-by-city.p.rapidapi.com'
    request["x-rapidapi-key"] = '7188ca30eemsh24dc91f4f4d2aeap15bbf4jsndeff3fcc5a96'
    response = http.request(request)
    JSON.parse(response.read_body)
  end

  def dest_temp
    self.api_data["TempF"]
  end

  def dest_weather
    self.api_data["Weather"]
  end

  def dest_humidity
    "#{self.api_data["RelativeHumidity"]}%"
  end
  
  def dest_air_quality
    self.api_data["AirQuality"]
  end

end
