class Api::V1::SchoolsController < ApplicationController
  def index
    institutions = Institution.all
    render json: InstitutionRequestService.new(params, institutions).index
  end

  def show
    institution = Institution.find(params[:id])
    render json: InstitutionRequestService.new(params).show(institution)
  end

  def create
    institution = Institution.new(institution_params)
    if institution.save
      render json: success_message
    else
      render json: failure_message
    end
  end

  private

    def institution_params
      params.require(:school).permit(:name)
    end

    def success_message
      { :message => "Successfully Created" }
    end

    def failure_message
      { :message => "Something went wrong. Please try again" }
    end
    
end
