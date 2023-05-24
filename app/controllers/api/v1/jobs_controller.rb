class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: %i[show destroy]

  def index
    sql = Job.connection.execute <<-SQL
      select 
        jobseekers.id as jobseeker_id,
        jobseekers.name as jobseeker_name,
        jobs.id as job_id,
        jobs.title as job_title,
        jobseekers.skills as jobseeker_skills,
        jobs.required_skills as required_skills
      from jobseekers, jobs
      where string_to_array(jobseekers.skills, ',') && string_to_array(jobs.required_skills,( ','));
    SQL

    # with elements (element) as (
    #   select unnest(ARRAY['a','b','c','a','a'])
    # )

    res = sql.values.map do |row|
      skill_count = (row[4].split(',') & row[5].split(',')).count
      res_row = row[0..-3] << skill_count
    end

    res.sort_by!{ |e| [ e[0], e[-1] ]}

    res.each do |row|
      p row
    end

    render json: res.to_json

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
