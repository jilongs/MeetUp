class JoinGroup < ActiveRecord::Base
  attr_accessible :group_id, :user_id
  belongs_to :group
  belongs_to :user

  validates :group, presence: true
  validates :user, presence: true
  validates :user_id, uniqueness: { scope: :group_id }
  after_create :increase_user_count
  after_destroy :decrease_user_count
  def getID(group_id, user_id)
    return JoinGroup.where(:group_id=>group_id, :user_id=>user_id).id
  end
  private
    def increase_user_count
      group = self.group
      group.user_count += 1
      group.save
    end
    def decrease_user_count
      group = self.group
      group.user_count -= 1
      group.save
    end
end
