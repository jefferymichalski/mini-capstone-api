class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    render :index
  end

  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    calc_subtotal = 0

    carted_products.each do |carted_product|
      product = Product.find_by(id: carted_product.product_id)
      price = product.price
      calc_subtotal += price * carted_product.quantity.to_i
    end

    calc_tax = calc_subtotal * 0.09
    calc_total = calc_subtotal + calc_tax

    @order = Order.create(
      user_id: current_user.id,
      subtotal: calc_subtotal,
      tax: calc_tax,
      total: calc_total,
    )
    carted_products

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
