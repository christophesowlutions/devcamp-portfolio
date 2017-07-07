module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(User)
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    else
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    end
  end

  def source_helper
    # Definition could be as follows:
    # def source_helper (layout_name) and write if(layout_name = x) pass a design and if layout_name = y then pass another thing.
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    DevcampViewTool::Renderer.copyright 'Chris', 'All Rights Reserved'
  end
end
