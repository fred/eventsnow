class Page < ActiveRecord::Base

  LANGUAGES = ["en", "ar"]
  
  validates_presence_of :title
  validates_presence_of :permalink
  validates_presence_of :body
    
  def self.find_permalink(permalink)
    self.find(:first, :conditions => ["permalink = ?", permalink])
  end
  
  def set_permalink
    if self.permalink.to_s.empty?
      self.permalink = (self.published_at.strftime("%Y_%m_%d"))+"-"+permalink_for(self.title.to_s)
    end
  end
  
  def permalink_for(str)
    PermalinkFu.escape(str)
  end  

end
