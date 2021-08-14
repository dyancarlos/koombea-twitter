class UserDecorator < ApplicationDecorator
  delegate_all

  def name_with_username
    "#{object.full_name} (@#{object.username})"
  end
end