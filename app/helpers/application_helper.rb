# frozen_string_literal: true

module ApplicationHelper
  def set_title(title = '')
    base_title = 'Healthy Food'
    if title.present?
      "#{title} | #{base_title}"
    else
      base_title
    end
  end
end
