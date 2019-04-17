class RmlbLocation < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable
  belongs_to :user
  self.primary_key = :user_id
  
  validates_uniqueness_of :user_id
  validates :user_id, presence: true
 
  #validates :at, :uniqueness => {:scope => :user_id}
 
  attr_accessible :location
  attr_accessible :start_time, :end_time
  attr_accessible :memo

  def self.find_or_create(user_id)
    # primekey_change   rmlb_location = RmlbLocation.where(['user_id = ?', user_id]).first
    rmlb_location = RmlbLocation.find(user_id)
    
    
    unless rmlb_location.present?
      rmlb_location = RmlbLocation.new()
      rmlb_location.user_id = user_id
      
      # Set default
      rmlb_location.location = ''
      rmlb_location.start_time = ''
      rmlb_location.end_time = ''
      rmlb_location.memo = ''
            
      rmlb_location.save!
    end
    rmlb_location
  end

end
