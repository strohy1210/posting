class Event < ActiveRecord::Base

  def get_location_details
    results = Geocoder.search(self.address)
    result = results.first.data
    address = result["formatted_address"]
    binding.pry
    zipcode = result["address_components"].last["long_name"]
    zipcode = result["address_components"][result["address_components"].size -1]["long_name"] if zipcode.length < 5
    if result["types"][0] == "street_address"       
      street = result["address_components"][1]["long_name"]
    elsif result["types"].size === 3     
      street = result["address_components"][2]["long_name"]
    else      
      street = result["address_components"][3]["long_name"]
    end
    self.update(address: address, zipcode: zipcode, street: street)
  end

end
