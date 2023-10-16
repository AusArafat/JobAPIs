class JobsController < ApplicationController
  before_action :authorize_request

  # GET /jobs
  def get_all_jobs
    @job = Job.all
    render json: @job
  end

  # GET /jobs/1
  def get_job_by_id
    begin
      @job = Job.find(params[:id])
      render json: @job
    rescue ActiveRecord::RecordNotFound => e
      head :no_content
    end
  end

  # POST /jobs
  def create_job
    @job = Job.new(job_params)
    if @job.save
      render json: {"RecordStatus" => "Created"}, status: :created
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:JobName, :JobDescription)
    end
end
