class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :signed_in?
  helper_method :current_user
  helper_method :getJoinGroupID
  helper_method :getJoinMeetID

  def signed_in?
    return session[:user_id].present?
  end

  def current_user
    return @current_user ||= User.find_by_id(session[:user_id])
  end

  def getJoinGroupID(group_id, user_id)
    join_group = JoinGroup.where(:group_id=>group_id, :user_id=>user_id)
    return join_group[0].id
  end

  def getJoinMeetID(meet_id, user_id)
    join_meet = JoinMeet.where(:meet_id=>meet_id, :user_id=>user_id)
    return join_meet[0].id
  end
end
