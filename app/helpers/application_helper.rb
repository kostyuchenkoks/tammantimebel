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

  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end  
end
