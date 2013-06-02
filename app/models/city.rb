class City < ActiveRecord::Base
  attr_accessible :name, :state_id
  belongs_to :state
  has_many :meet
  def full_name
    name = "#{self.state.name}-#{self.name}"
    return name
  end
end
