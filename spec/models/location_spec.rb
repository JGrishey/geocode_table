require "rails_helper"

RSpec.describe Location, type: :model do

    before(:all) do
        @location_default = create(:location)
    end

    it "is valid when having valid attributes" do
        expect(@location_default).to be_valid
    end

    it "is invalid when not having an address" do
        @location_no_address = build(:location, address: nil)
        expect(@location_no_address).to_not be_valid
    end

    it "is invalid when not having a longitude" do
        @location_no_longitude = build(:location, longitude: nil)
        expect(@location_no_longitude).to_not be_valid
    end

    it "is invalid when not having a latitude" do
        @location_no_latitude = build(:location, latitude: nil)
        expect(@location_no_latitude).to_not be_valid
    end

end