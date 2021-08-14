class TweetDecorator < ApplicationDecorator
  delegate_all

  def content
    html  = h.content_tag(:div, "#{object.user.full_name}, @#{object.user.username}")
    html += h.content_tag(:div, object.content)
    html
  end
end