class SchoolsController < ApplicationController
  def index
    institutions = Institution.all
    render json: InstitutionRequestService.new(params).index(institutions)
  end

  def show
    institution = Institution.find(params[:id])
    render json: InstitutionRequestService.new(params).show(institution)
  end
end
