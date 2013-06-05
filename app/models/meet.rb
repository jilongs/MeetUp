class Meet < ActiveRecord::Base
  attr_accessible :city_id, :content, :title, :user_id, :user_count, :date
  belongs_to :city
  belongs_to :user
  has_many :join_meet
  validates_uniqueness_of :title, :date
  after_create :join_this_meet
  private
    def join_this_meet
      join_meet = JoinMeet.new
      join_meet.meet_id = self.id
      join_meet.user_id = self.user_id
      join_meet.save
    end
end
