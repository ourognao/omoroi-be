class UtilsController < ApplicationController
  before_action :set_default_folder_views

  def release_email
    @releaseEmails = ReleaseEmail.create(email: params[:email])
    
    return if @releaseEmails.errors.present?
    
    Utils.slack(to: 'release_emails', message: "#{@releaseEmails.email}")
  end
  
  def set_default_folder_views
  	prepend_view_path("app/views/utils")
  end
end
