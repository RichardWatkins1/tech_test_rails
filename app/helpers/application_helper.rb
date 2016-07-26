module ApplicationHelper

  def alert_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
      }[flash_type.to_sym] || flash_type.to_s
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    return markdown.render(text).html_safe
  end

end
