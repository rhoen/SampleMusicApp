module ApplicationHelper
  def authenticate_form
    <<-HTML.html_safe
    <input type="hidden"
    name="authenticity_token"
    value="#{form_authenticity_token}">
    HTML

  end
end
