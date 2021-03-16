class ApplicationController < ActionController::Base
  include Sessionable
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :authenticate_user
end
