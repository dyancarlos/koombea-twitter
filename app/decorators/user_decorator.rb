class UserDecorator < ApplicationDecorator
  def name_with_username
    "#{object.full_name} (@#{object.username})"
  end
end