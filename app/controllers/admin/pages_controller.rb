class Admin::PagesController < Admin::BaseController
  
  before_filter :get_pages, :except => ["show"]

  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])
    
    respond_to do |format|
      if @page.save
        expire_page :action => "index"
        flash[:notice] = 'Page was successfully created.'
        format.html { redirect_to(admin_pages_path) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        expire_page :action => "show", :id => @page.id
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect_to(admin_pages_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  rescue => e
    flash[:error] = e
    render :action => "edit"
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    expire_page :action => "index"
    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
  
  # Not found
  def moved_permanently
    # this is good if you have old page deleted 
    # or changed the tittle of a page, then
    # search engines will see 301 and delete it on their index.
    flash[:notice] = "Sorry, Page not found or moved permanently"
    @title = "Sorry, Page not found or moved permanently"
    headers["Status"] = "301 Moved Permanently"
    redirect_back_or_default("/")
  end
  
  def get_pages
    @pages = Page.find(:all, :order => "language DESC, updated_at DESC" )
  end
  
end
