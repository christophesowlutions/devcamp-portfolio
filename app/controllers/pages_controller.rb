class PagesController < ApplicationController
  before_action :only_authenticated!, except: [:home]


  def home
    @posts = Blog.all
  end

  def about
  end

  def contact
  end

  def hello
    @blogs = Blog.all
  end

  def tech_news
    @tweets = SocialTool.twitter_search
  end

end
