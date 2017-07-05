class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all # Call the model whch is inside the controller and make it available to the view
  end

  def new
    @portfolio_item = Portfolio.new
  end
  
  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
 
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to @portfolio_item, notice: 'Portfolio Item is now live' }      
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id]) # This is looking into the parameters of the URI Pattern found by typing rake routes in the terminal
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|

      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_
          to portfolios_path, notice: 'The record was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was removed' } 
    end
  end

end
