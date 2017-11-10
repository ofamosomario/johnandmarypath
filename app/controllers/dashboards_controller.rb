class DashboardsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @total_breadcrumb = Breadcrumb.count
  end

end
