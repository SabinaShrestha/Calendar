module ApplicationHelper

  def active_for_page(scope)
    controller, action = *scope.split('#')
    if params[:controller] == controller && params[:action] == action
      return "active"
    end
  end

  def user_signed_in?
    current_user.present?
  end
end
