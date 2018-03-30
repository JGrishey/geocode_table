class PagesController < ApplicationController
    def home
        @location = Location.new
        @locations = Location.all.order('created_at DESC')
    end
end