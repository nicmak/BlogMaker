class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
  layout "portfolios"

  def index
    # @portfolio_items = Portfolio.ruby_on_rails_portfolio_items
    # Portfolio.angular lets you get angular portfolio items
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def ruby_rails
    @ruby_rails_items = Portfolio.ruby_on_rails_portfolio_items
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build}
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update 
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Portfolio edit was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path , notice: 'Portfolio destroyed'}
    end
  end

  private
  
  def portfolio_params
    params.require(:portfolio).permit(
      :title, 
      :body, 
      :subtitle, 
      technologies_attributes: [
        :name
      ]
    )
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

end
