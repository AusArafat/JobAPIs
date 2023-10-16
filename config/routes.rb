Rails.application.routes.draw do
=begin
  devise_for :users
  scope '/admin' do

  end
=end

  #Login Route
  post '/auth/login' => 'authentication#login'

  #Registration router
  post '/auth/register' => 'authentication#register'

  #Job related routes
  get '/jobs' => 'jobs#get_all_jobs'
  get '/jobs/:id' => 'jobs#get_job_by_id'
  post '/jobs' => 'jobs#create_job'

  #Job Application Related Routes
  get '/job_applications' => 'job_applications#get_all_job_applications'
  get '/job_applications/:id' => 'job_applications#get_job_applications_by_id'
  post '/job_applications' => 'job_applications#create_job_application'

end
