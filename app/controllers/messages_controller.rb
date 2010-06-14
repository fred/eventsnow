class MessagesController < ApplicationController
  
  layout 'users'
  
  def index
    @title = "Thank you for your message"
  end
  
  def new
    @title = "Leave us a Message"
    @message = Message.new
  end
  
  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice] = "Message Successfully sent."
      redirect_to :action => "index"
    else
      render :action => 'new'
    end
  end

end
