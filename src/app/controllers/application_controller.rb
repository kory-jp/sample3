class ApplicationController < ActionController::Base
  include Sessionable
  protect_from_forgery with: :exception
  before_action :current_user
end
