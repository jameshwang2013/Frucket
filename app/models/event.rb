class Event < ActiveRecord::Base
  belongs_to :bucket
  belongs_to :user
  
  def completed?
  	!completed_at.blank?
  end
end
