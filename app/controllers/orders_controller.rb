class OrdersController < ApplicationController
  def create
    order = Order.new(order_params)
    order.user_id = current_user.id
    if order.save
      render json: order, status: :created
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :product_id, :quantity, :subtotal, :tax, :total)
  end

  def show
    order = Order.find(params[:id])
    render json: order
  end

  def index
    orders = Order.all
    render json: orders
  end
end
