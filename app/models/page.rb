class Page < ActiveRecord::Base
  attr_accessible :title, :permalink, :body, :language_id
end
