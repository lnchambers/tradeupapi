class Api::V1::LocationsController < ApplicationController
  def index
    i = Institution.all
    render json: LocationRequestService.new(i).index
  end
end
