class User < ActiveRecord::Base
  attr_accessible :email, :introduction, :name, :password, :password_confirmation
  has_secure_password
  validates_uniqueness_of :name, :email
  has_many :group
  has_many :join_group
  has_many :meet
  has_many :join_meet
end
