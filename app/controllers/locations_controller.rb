class LocationsController < ApplicationController
    def create
        address = params[:location][:address]

        request_uri = URI.parse(url(address))

        res = Net::HTTP.get(request_uri)

        usable_data = JSON.parse(res)

        if usable_data["results"].any?
            lat = usable_data["results"][0]["geometry"]["location"]["lat"]
            long = usable_data["results"][0]["geometry"]["location"]["lng"]
            address = usable_data["results"][0]["formatted_address"]

            @location = Location.new(latitude: lat, longitude: long, address: address)
            
            respond_to do |format|
                if @location.save
                    format.js
                    format.json { render json: @location }
                else
                    format.json { render json: @location.errors }
                end
            end
        else
        end
    end

    def destroy
        @location = Location.find(params[:id])
        @location.destroy
    end

    private

    def url (address)
        uri = "https://maps.googleapis.com/maps/api/geocode/json?address=" + address.tr(' ', '+').to_s + "&key=" + Rails.application.secrets.GEOCODE_KEY.to_s

        uri
    end
end 