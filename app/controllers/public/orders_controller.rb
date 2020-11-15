class Public::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_search
  def update
    # @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(params[:id])
    #  binding.pry
    if @order.update(status: order_params[:status].to_i)
        if params[:order][:status] == "1"
            @order.order_details.each do |order_detail|
                order_detail.shipping_status = 1
                order_detail.save
            end
        end
      redirect_to sold_detail_public_order_path(@order)
    else
      render 'index'
    end
    
  end
  def index
    # Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      @orders = Order.where(user_id:current_user.id)
      cart_items = CartItem.where(user_id:current_user.id)
      #@users = User.where(id:@orders.user_id)
  end
def show
  # binding.pry
    @order = Order.find(params[:id])
    @order_payment = "クレジット"
    @order_details = OrderDetail.where(order_id: @order.id)
end


def edit
end

# @order = Order.find(params[:id])
# @order_details = OrderDetail.where(order_id: @order.id)
# @cart_items = current_user.cart_items
# @sum = 0
# @order.order_details.each do |order_detail|
# @sum = @sum + (order_detail.item.price*1.08*order_detail.amount).round
# end
# @sum


def destroy
end

# def current_user
#   User.find(session[:user_id])
# end

def new
  @order = Order.new
end
def create
  @order = current_user.orders.new(order_create_params)
  @order.status = 0
  @order.order_details.each do |order_detail|
    order_detail.shipping_status = 0
    order_detail.save
  end
  @order.buyer_id = current_user.id
  if @order.save
    @cart_items = current_user.cart_items
    @cart_items.each do |cart_item|
      @order_details = @order.order_details.new
      @order_details.photo_id = cart_item.photo.id
      @order_details.price = cart_item.photo.price * 1.08
      @order_details.amount = cart_item.amount
      @order_details.shipping_status = 0
      @order_details.save
    end
    current_user.cart_items.destroy_all
    redirect_to  complete_public_orders_path
         else
            render "confirm"
    end
end
  def confirm
      if params['payjp-token'] == ''
        flash[:notice] = 'payjp token is empty'
        @order = current_user.orders.new(order_params)
        return render :new
        # redirect_to  complete_public_orders_path
      end
      @order = current_user.orders.new
      @order_postal_code = params[:order][:postal_code]
      @cart_items = current_user.cart_items
      CartItem.where(user_id: current_user.id)
      @order_payment = params[:order][:payment_method]
      #@order_payment = 'credit'
      @address_option = params[:order][:address_option]
      if @address_option == "0"
          @order_address = Order.new(address: current_user.address,postal_code: current_user.postal_code,name: current_user.first_name + current_user.last_name)
      elsif @address_option == "1"
          @order_address = Order.new(order_params)
      end
  end
  def sold
    user = User.find(params[:id])
    @order_details = OrderDetail.where(photo_id: user.photos).pluck(:order_id)
    @orders = Order.where(id: @order_details)
  end
    def sold_detail
      @order = Order.find(params[:id])
      @order_details = @order.order_details.where(photo_id:current_user.photos.pluck(:id))
      @order_payment = "クレジット"
  end
  private
  def order_params
      params.require(:order).permit(:cart_item_id,:postal_code,:address,:name,:payment_method,:status,:total_payment)
    end
    def order_create_params
      params.require(:order).permit(:postal_code,:address,:name,:payment_method,:total_payment,:buyer_id)
    end
end
