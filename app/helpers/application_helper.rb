module ApplicationHelper
  def path_to_js_for_current_page
    current_path = "#{controller_name}/#{action_name}_page"
    Rails.application.assets.resolve(current_path).blank? ? '' : current_path
  end

  def flash_messages
    message_classes = {
      notice: 'alert-info',
      success: 'alert-success',
      alert: 'alert-warning',
      error: 'alert-danger'
    }

    flash.each do |type, message|
      concat(
        content_tag(:div, message, class: "alert #{message_classes[type.to_sym] || type.to_s} fade in") do
          concat content_tag(:button, '×', class: 'close', data: { dismiss: 'alert' })
          concat message
        end
      )
    end
  
    nil
  end
end
