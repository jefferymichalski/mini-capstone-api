class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    render :index
  end

  def create
    # Find the product with an id of params[:product_id]
    # Then grab its price
    # Then multiply it by params[:quantity]
    product = Product.find_by(id: params[:product_id])
    price = product.price
    calculated_subtotal = price * params[:quantity].to_i
    # Multiply the subtotal by the tax rate
    calculated_tax = calculated_subtotal * 0.09
    # Add the subtotal and tax
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    render :show
  end

  def show
    # METHOD 1
    # @order = Order.find_by(id: params[:id])
    # if current_user.id == @order.user_id
    #   render :show
    # else
    #   render json: {}, status: :unauthorized
    # end

    # METHOD 2
    # @order = Order.find_by(id: params[:id], user_id: current_user.id)
    # render :show

    # METHOD 3
    @order = current_user.orders.find_by(id: params[:id])
    render :show
  end
end