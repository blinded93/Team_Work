class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  #before_action :set_assignment
#  before_action :set_task


    def after_sign_in_path_for(assignment)
      request.env['omniauth.origin'] || root_path
    end
end#class
