class Chore < ActiveRecord::Base
  belongs_to :client
  belongs_to :contractor, class_name:"Client"
  belongs_to :request
  belongs_to :network
  def full_street_address
    [address, city, state].compact.join(', ')
  end
  geocoded_by :full_street_address
  after_validation :geocode, :if => :address_changed?

  validates :title, :description, :rate, :start, :end, :address, :city, :state, :presence => true
  # validate :future_event
  # validate :date_validation

  # private
  # def future_event
  # 	errors.add(:start, "can't be in the past") if start < Time.now
  # end 
  # def date_validation
  # 	errors.add(:end, "end date can't be before start date") if :end > :start
  # end
end

