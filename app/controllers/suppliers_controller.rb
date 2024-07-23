class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render json: @suppliers
  end

  def show
    @supplier = Supplier.find(params[:id])
    render json: @supplier
  end

  def new
    @supplier = Supplier.new
    render json: @supplier
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      render json: @supplier, status: :created, location: @supplier
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
    render json: @supplier
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(supplier_params)
      render json: @supplier, status: :ok, location: @supplier
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    head :no_content
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :email, :phone_number)
  end
end
