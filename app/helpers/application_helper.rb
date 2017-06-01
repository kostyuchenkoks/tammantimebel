module ApplicationHelper
  # Возвращает полный заголовок для страницы.
  def full_title(page_title)
    base_title = "Tammantimebel"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
