class EventsController < ApplicationController
  layout 'events'
  
  before_filter :require_admin, :only => [:edit, :destroy, :update]
  
  def index
    @title ||= "Events"
    @calendar_events = Event.approved
    @featured_events = Event.approved.featured.this_month.unfinished.limit(4)
    @this_month_events = Event.approved.not_featured.this_month.unfinished.limit(4)
    @next_month_events = Event.approved.not_featured.next_month.unfinished.limit(4)
    @past_events = Event.approved.finished.limit(6)
    respond_to do |format|
      format.html { render :layout => "application" }
      format.xml  { render :xml => @events }
    end
  end
  
  def show
    @event = Event.find(params[:id])
    if @event.active
      respond_to do |format|
        format.html
        format.xml  { render :xml => @event }
      end
    else
      flash[:notice] = "This Event is pending Approval."
      respond_to do |format|
        format.html { render :action => "thank_you"}
        format.xml  { render :xml => @event }
      end
    end

  end
  
  def new
    @title = "New Event"
    @event = Event.new
    @event.active = false
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @event }
    end
  end
  
  def edit
    @event = current_user.own_events.find(params[:id])
  end
  
  def create
    @event = Event.new(params[:event])
    @event.active = false
    respond_to do |format|
      if @event.save
        flash[:success] = "Thank you, your event has been submitted."
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @event = current_user.events.find(params[:id])
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
