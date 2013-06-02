class Group < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :user_count
  belongs_to :user
  has_many :join_group
  validates_uniqueness_of :title
  after_create :join_this_group
  private
    def join_this_group
      join_group = JoinGroup.new
      join_group.group_id = self.id
      join_group.user_id = self.user_id
      join_group.save
    end
end
