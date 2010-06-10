class PagesController < ApplicationController
  
  layout "users"
  
  def index
    flash[:notice] = nil
    flash[:error] = nil
    @page = Page.find(:first, :conditions => ["language = ?", session[:language]])
    # @page = @home_page
    respond_to do |format|
      format.html { render :action => :show }
      format.xml  { render :xml => @page }
    end
  end
  
  def show
    flash[:notice] = nil
    flash[:error] = nil
    if params[:permalink]
      @page = Page.find_permalink(params[:permalink])
    end
    
    if params[:id] #&& authorized_admin?
      @page = Page.find(params[:id])
    end
    
    respond_to do |format|
      format.html {
        redirect_to(:action => "index", :language => session[:language]) if @page.language != session[:language]
      }
      format.xml  { render :xml => @page }
    end
  end
  
end
