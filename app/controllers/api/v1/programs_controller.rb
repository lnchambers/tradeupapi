class Api::V1::ProgramsController < ApplicationController
  def index
    programs = Program.all
    render json: programs
  end
end