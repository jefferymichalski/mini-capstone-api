class ProductsController < ApplicationController
  def index
    @Products = Products.all
    render :index
  end

  def show
    @Product = Products.find_by(id: params[:id])
    render :show
  end
end
