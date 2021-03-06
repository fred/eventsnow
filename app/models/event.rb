class Event < ActiveRecord::Base
  
  named_scope :limit, lambda { |limit| { :limit => limit } }
  
  named_scope :approved,    :conditions => {:active => true}
  named_scope :unapproved,  :conditions => {:active => false}
  named_scope :featured,    :conditions => {:featured => true}
  named_scope :not_featured,:conditions => {:featured => false}
  named_scope :this_month,  :conditions => ["month(start_date) = ? AND year(start_date) = ?", Time.now.month,  Time.now.year ]
  named_scope :next_month,  :conditions => ["month(start_date) = ? AND year(start_date) = ?", Time.now.month+1,Time.now.year ]
  named_scope :last_month,  :conditions => ["month(start_date) = ? AND year(start_date) = ?", Time.now.month-1,Time.now.year ]
  named_scope :finished,    :conditions => ["end_date < ?", Time.now+1.day ] # give one day for timezone mismatch
  named_scope :unfinished,  :conditions => ["end_date > ?", Time.now-1.day ] # give one day for timezone mismatch  
  
  belongs_to :owner, :class_name => "User"
  
  LANGUAGES = ["en", "ar"]
  
  SPEAKER_TYPES = [
    {:id => 0, :name => "Individual"},
    {:id => 1, :name => "Group"}
  ]
  
  has_attached_file :avatar, 
  :styles => { 
    :large  => "240x240>", 
    :medium => "160x160>", 
    :small  => "120x120>", 
    :thumb  => "80x80>"
  }
  
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_and_belongs_to_many :users
  
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :location
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :sponsor_name
  # validates_presence_of :sponsor_email
  validates_email_format_of :sponsor_email, :check_mx => true
  validates_presence_of :phone_number
  
  validates_length_of :title,       :in => 4..40
  validates_length_of :description, :in => 10..800
  validates_length_of :location,    :in => 4..30
  
  validates_numericality_of :speaker_type
  validates_numericality_of :speakers_count, :allow_nil => true
  validates_numericality_of :maximum_users, :allow_nil => true
  
  has_attached_file   :document1
  has_attached_file   :document2
  has_attached_file   :document3
  has_attached_file   :document4
  has_attached_file   :document5
  has_attached_file   :document6
  
  # validates_attachment_size :document1, :less_than => 8.megabytes
  # validates_attachment_size :document2, :less_than => 8.megabytes
  # validates_attachment_size :document3, :less_than => 8.megabytes
  # validates_attachment_size :document4, :less_than => 8.megabytes
  # validates_attachment_size :document5, :less_than => 8.megabytes
  # validates_attachment_size :document6, :less_than => 8.megabytes
  
  def start_date_formatted
    if self.allday
      self.start_date.strftime("%d %B, %Y")
    else
      self.start_date.strftime("%d %b, %H:%M")
    end
  end
  
  def end_date_formatted
    if self.allday
      self.end_date.strftime("%d %B, %Y")
    else
      self.end_date.strftime("%d %b, %H:%M")
    end
  end
  
  
  def full_message
    "This event is currently full and we are not allowing for any more registrations at this time. 
    We do apologize for this, but would like to offer you to be added to our Waiting List. 
    Fill out the following form, then if someone cancels their registration, 
    you will be notified of the opening and your availability to then register."
  end
  
  def show_speaker_type
    Event::SPEAKER_TYPES.each do |t| 
      if t[:id] == 1
        return t[:name]
      end
    end
  end
  
  def money
    Money.new(self.price.to_f*100, "USD")
  end
  
  def files_count
    i = 0
    i += 1 if self.document1.exists?
    i += 1 if self.document2.exists?
    i += 1 if self.document3.exists?
    i += 1 if self.document4.exists?
    i += 1 if self.document5.exists?
    i += 1 if self.document6.exists?
    i 
  end

  def event_started?
    self.start_date.to_i > Time.now.to_i
  end  
  
  def event_finished?
    self.end_date.to_i > Time.now.to_i
  end
  
  def deliver_notification
    logger.info(" Going to send email now.")
    Thread.new{ Notifications.deliver_new_application_form(self) }
  end
  
end
