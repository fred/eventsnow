class UsersController < ApplicationController
  
  layout 'users'
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:index, :show, :edit, :update]
  
  def index
    redirect_to :action => 'show'
  end
  
  def new
    @title = "Registration"
    @user = User.new
    @user_session = UserSession.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.admin = false
    if @user.save
      flash[:notice] = t("account_registered")
      redirect_back_or_default edit_account_url
    else
      render :action => :new
    end
  end
  
  def user
    if params[:login]
      @user = User.find(:first, :conditions => ["login = ? AND admin = ?", params[:login],false])
    end
    @title = "#{@user.login}'s profile"
    render :action => "show"
  rescue
    flash[:error] = "Sorry. User not found."
    redirect_to account_url
  rescue
    
  end
  
  def show
    @user = @current_user
    @title = "#{@user.login}'s profile"
  end

  def edit
    @title = "Editing my Profile"
    @user = @current_user
  end
  
  def update
    @user = @current_user
    @user.admin = false unless current_user.admin?
    if @user.update_attributes(params[:user])
      flash[:success] = t("account_updated")
      redirect_to account_url
    else
      render :action => :edit
    end
  end

end
