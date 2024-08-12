class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(carted_product_params)
    @carted_product.user_id = current_user.id
    @carted_products.order_id = nil
    @carted_products.status = "carted"

    if @carted_product.save
      render json: @carted_product, status: :created
    else
      render json: @carted_product.errors, status: :unprocessable_entity
    end
  end

  private

  def carted_product_params
    params.require(:carted_product).permit(:product_id, :quantity, :user_id, :order_id, :status)
  end
end
