class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pins, dependent: :destroy
  has_many :buckets
  has_many :events

  validates :name, presence: true

  has_attached_file :avatar, :styles => { :medium => "150x150#", :thumb => "50x50#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
