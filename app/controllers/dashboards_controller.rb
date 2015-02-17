class DashboardsController < ApplicationController
  before_filter :require_login, :only => :show

  def show
  end
end
