class Api::V1::JobseekersController < ApplicationController
  before_action :set_jobseeker, only: %i[show destroy]

  def index
    jobseeker = Jobseeker.all.order(created_at: :desc)
    render json: jobseeker
  end

  def create
    jobseeker = Jobseeker.create!(jobseeker_params)
    if jobseeker
      render json: jobseeker
    else
      render json: jobseeker.errors
    end
  end

  def show
    render json: @jobseeker
  end

  def destroy
    @jobseeker&.destroy
    render json: { message: 'jobseeker deleted!' }
  end

  private

  def jobseeker_params
    params.permit(:title, :required_skills)
  end

  def set_jobseeker
    @jobseeker = Jobseeker.find(params[:id])
  end
end
