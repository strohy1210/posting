class Event < ActiveRecord::Base

  def initialize(query, x, t)
    @query = query
    @max_price = x
    @max_time = t
    result = Geocoder.search(@query)

    @latitude= result.first.data["geometry"]["location"]["lat"]
    @longitude= result.first.data["geometry"]["location"]["lng"]
    @address = result.first.data["formatted_address"]
    if result.first.data["types"][0] == "street_address"
       @address_num = result.first.data["address_components"][0]["long_name"]
       @road = result.first.data["address_components"][1]["long_name"].gsub("Street", "st").downcase.split.join("%20")
    elsif result.first.data["types"].size === 3
      @address_num =result.first.data["address_components"][1]["long_name"]
      @road = result.first.data["address_components"][2]["long_name"].gsub("Street", "st").downcase.split.join("%20")
    else
      @address_num = result.first.data["address_components"][2]["long_name"]
      @road = result.first.data["address_components"][3]["long_name"].gsub("Street", "st").downcase.split.join("%20")
    end
  end
  
end
