class Event < ActiveRecord::Base
  belongs_to :bucket
  belongs_to :user
    has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    validates :image, presence: true
  
  def completed?
  	!completed_at.blank?
  end
end
