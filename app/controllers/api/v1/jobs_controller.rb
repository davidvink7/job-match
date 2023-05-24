class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: %i[show destroy]

  include JobsHelper

  def index
    jobs = JobsHelper.match

    jobs.values.each do |row| p row end

    render json: jobs
  end

  def create
    job = Job.create!(job_params)
    if job
      render json: job
    else
      render json: job.errors
    end
  end

  def show
    render json: @job
  end

  def destroy
    @job&.destroy
    render json: { message: 'job deleted!' }
  end

  private

  def job_params
    params.permit(:name, :skills)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
