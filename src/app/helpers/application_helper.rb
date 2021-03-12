module ApplicationHelper
  def header_link_item(name, path)
    class_name << ' active' if current_page?(path)

    content_tag :li, class: class_name do
      link_to name, path
    end
  end
end
