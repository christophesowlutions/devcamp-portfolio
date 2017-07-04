class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all # Call the model whch is inside the controller and make it available to the view
  end
end
