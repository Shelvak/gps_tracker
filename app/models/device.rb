class Device < ActiveRecord::Base
  has_paper_trail

  validates :identifier, :truck_id, presence: true
  has_many :locations

  def disable!
    update!(enabled: false)
  end

  def truck
    truck_id #TODO
  end

  def auth?
    enabled?
  end
end
