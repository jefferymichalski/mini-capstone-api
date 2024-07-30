class OrdersController < ApplicationController
  def create
    product = Product.find(order_params[:product_id])
    quantity = order_params[:quantity].to_i
    subtotal = product.price * quantity
    tax = calculate_tax(subtotal)
    total = subtotal + tax

    order = Order.new(order_params.except(:subtotal, :tax, :total))
    order.user_id = current_user.id
    order.subtotal = subtotal
    order.tax = tax
    order.total = total

    if order.save
      render json: order, status: :created
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end

  def calculate_tax(subtotal)
    subtotal * 0.1
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :product_id, :quantity, :subtotal, :tax, :total)
  end

  def show
    order = Order.find(params[:id])
    if order.user_id == current_user.id
      render json: order
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def index
    orders = Order.where(user_id: current_user.id)
    render json: orders
  end
end
