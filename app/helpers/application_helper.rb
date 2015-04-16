module ApplicationHelper
  def authenticate_form
    <<-HTMLs
    <input type="hidden"
    name="authenticity_token"
    value="form_authenticity_token">
    HTMLs
    .html_safe
  end
end
