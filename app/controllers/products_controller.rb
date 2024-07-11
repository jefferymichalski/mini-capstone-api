class ProductsController < ApplicationController
  def index
    @products = products.all
    render :index
  end

  def show
    @product = products.find_by(id: params[:id])
    render :show
  end
end
