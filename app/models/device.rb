class Device < ActiveRecord::Base
  has_paper_trail

  validates :identifier, :truck_id, presence: true

  def disable!
    update!(enabled: false)
  end
end
