module PostsHelper
  def status_badge status
    status_span_generator status
  end

  private

    def status_span_generator status
      case status
        when 'submitted'
          content_tag(:span, status.titleize, class: 'badge badge-primary')
        when 'approved'
          content_tag(:span, status.titleize, class: 'badge badge-success')
        when 'rejected'
          content_tag(:span, status.titleize, class: 'badge badge-danger')
        when 'pending'
          content_tag(:span, status.titleize, class: 'badge badge-warning')
        when 'confirmed'
          content_tag(:span, status.titleize, class: 'badge badge-success')
      end
    end
end
