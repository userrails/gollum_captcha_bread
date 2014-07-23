class DocumentsController < ApplicationController
  before_action :authenticate_user!
  
  add_breadcrumb "Home", :homes_path
  
  def index
    
  end
  
  def show
    
  end
  
  def show_pdf
    render :pdf => "show"
  end
  
  def show_report
    respond_to do |format|
      format.html
      format.xls{response.headers['Content-Disposition'] = "attachment; filename=.xls"}
    end
  end
end