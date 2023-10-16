class JobApplicationsController < ApplicationController
  #before_action :set_job_application, only: %i[ get_all_job_applications ]
  before_action :job_application_params, only: %i[ create_job_application ]


  # GET /job_applications or /job_applications.json
  def get_all_job_applications
    @job_applications = JobApplication.all
    render json: @job_applications
  end

  # GET /job_applications/1
  def get_job_applications_by_id
    begin
      @job_application = JobApplication.find(params[:id])
      if @job_application.present? && current_user.admin?
        @job_application.update({status: 'Seen'})
        render json: @job_application
      else
        head :no_content
      end
    end
  end

  # POST /job_applications or /job_applications.json
  def create_job_application
    @job_application = JobApplication.new({ 'job' => Job.find(@my_params[:job_id]), "user" => current_user })
    if @job_application.save
      render json: {"RecordStatus" => "Created"}, status: :created
    else
      render json: @job_application.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_application_params
      begin
        @my_params = params.require(:job_application).permit(:job_id)
      rescue ActionController::ParameterMissing => e
        render json: {"Error" => e.message}, status: :bad_request
        return
      end
    end
end
