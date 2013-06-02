class JoinMeet < ActiveRecord::Base
  attr_accessible :meet_id, :user_id
  belongs_to :meet
  belongs_to :user

  validates :meet, presence: true
  validates :user, presence: true
  validates :user_id, uniqueness: { scope: :meet_id }
  after_create :increase_user_count
  after_destroy :decrease_user_count
  private
    def increase_user_count
      meet = self.meet
      meet.user_count += 1
      meet.save
    end
    def decrease_user_count
      meet = self.meet
      meet.user_count -= 1
      meet.save
    end
end
