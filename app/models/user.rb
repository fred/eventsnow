class User < ActiveRecord::Base
  class DestroyDenied
  end
  
  has_and_belongs_to_many :events
  has_many :own_events, :class_name => "Event", :foreign_key => "owner_id"
  
  has_attached_file :avatar, 
  :styles => { 
    :large  => "240x240>", 
    :medium => "160x160>", 
    :small  => "120x120>", 
    :thumb  => "64x64>" 
  }
  
  acts_as_authentic
  
  before_destroy :keep_admin
  
  # get users that have requests within the last 24 hours
  def self.last_logged
    time = Time.now - (3600*24)
    self.find(:all, :conditions => ["last_request_at > ?",time], :order => "last_request_at DESC")
  end
    
  def admin?
    self.admin
  end
  
  def self.admin_count
    count(:conditions => ["admin = ?",true])
  end
  
  private
  
  def keep_admin
    if self.admin? && User.admin_count < 2
      #raise ActiveRecord::ActiveRecordError
      raise Exceptions::DestroyDenied
    end
  end
  
  
end
