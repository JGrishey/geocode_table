class Location < ApplicationRecord
    validates :longitude, presence: true
    validates :latitude, presence: true
    validates :address, presence: true
end