class EventsController < ApplicationController
  layout 'events'
  
  before_filter :require_user, :only => [:edit, :create, :destroy, :update, :new]
  
  # GET /events
  # GET /events.xml
  def index
    @title ||= "Events"
    @events = Event.paginate :page => params[:page], :per_page => @per_page 
    respond_to do |format|
      format.html { render :layout => "application" } # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @title = "New Event"
    @event = Event.new
    @event.owner_id = current_user.id
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = current_user.own_events.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    @event.owner_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :success => 'Thank you, your event has been submitted.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = current_user.events.find(params[:id])
    @event.owner_id = current_user.id
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :success => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  def js_enabled
    session[:javascript_updated] = true
    render :nothing => true 
  end
end
