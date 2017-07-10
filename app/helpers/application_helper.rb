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

  def source_helper(layout_name)
    # Definition could be as follows:
    # def source_helper (layout_name) and write if(layout_name = x) pass a design and if layout_name = y then pass another thing.
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
     nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a><#{tag_type}>"
    end
    nav_links.html_safe
  end

  def nav_items
    [
      {
        url:root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blogs'
      },
      {
        url: portfolios_path,
        title: "Portfolio"
      },

    ]
  end

  def copyright_generator
    DevcampViewTool::Renderer.copyright 'Chris', 'All Rights Reserved'
  end

  def active? path
    "active" if current_page? path # Return "active" if the current page tha we are on matches whatever path we passed into this method.
  end
end
