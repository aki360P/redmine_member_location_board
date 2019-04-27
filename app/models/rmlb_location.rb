class RmlbLocation < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable
  belongs_to :user
  self.primary_key = :user_id
  
  validates_uniqueness_of :user_id
  validates :user_id, presence: true
  
 
  def self.find_or_create(user_id)
    rmlb_location = RmlbLocation.where(['user_id = ?', user_id]).first
    
    unless rmlb_location.present?
      rmlb_location = RmlbLocation.new()
      rmlb_location.attributes = { user_id: user_id }
      
      # Set default
      rmlb_location.attributes = { user_priority: '50' }
      
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
