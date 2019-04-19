class RmlbLocation < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable
  belongs_to :user
  self.primary_key = :user_id
  
  validates_uniqueness_of :user_id
  validates :user_id, presence: true
 
  #validates :at, :uniqueness => {:scope => :user_id}
 
  attr_accessible :location
  attr_accessible :color
  attr_accessible :start_time, :end_time
  attr_accessible :memo
  attr_accessible :user_priority

  def self.find_or_create(user_id)
    rmlb_location = RmlbLocation.where(['user_id = ?', user_id]).first
    
    unless rmlb_location.present?
      rmlb_location = RmlbLocation.new()
      rmlb_location.user_id = user_id
      
      # Set default
      rmlb_location.user_priority = '50'
      rmlb_location.location = ''
      rmlb_location.color = ''
      rmlb_location.start_time = ''
      rmlb_location.end_time = ''
      rmlb_location.memo = ''
            
      rmlb_location.save!
    end
    rmlb_location
  end
  
  def self.create_all(user_ids)
    user_ids.each do |u|
      find_or_create(u)
    end
  end
  
end
