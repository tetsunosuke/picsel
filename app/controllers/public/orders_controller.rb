class Public::OrdersController < ApplicationController
  before_action :authenticate_user!
    
  def index
      @orders = Order.where(_id:current_user.id)
      cart_items = CartItem.where(user_id:current_user.id)
  end

  def create
       @order = current_user.orders.new(order_create_params)
       @order.status = 0
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

  def new
      @order = Order.new
  end

  def edit
  end

  def show
      # @order = Order.find(params[:id])
      # @order_details = OrderDetail.where(order_id: @order.id)
      # @cart_items = current_user.cart_items
      # @sum = 0
      # @order.order_details.each do |order_detail|
      # @sum = @sum + (order_detail.item.price*1.08*order_detail.amount).round
      # end
      # @sum
      
  end

  def upddate
      
  end

  def destroy
  end

  def confirm
      @order = current_user.orders.new
      @order_postal_code = params[:order][:postal_code]
      @cart_items = current_user.cart_items
      @order_payment = params[:order][:payment_method]
      @address_option = params[:order][:address_option]
      # @status = params[:order][:payment_method]

      # if order_params[:payment_method] == '有効'
      #     @order.payment_method = true
      # elsif order_params[:payment_method] == '無効'
      #     @order.payment_method = false
      # end
      if @address_option == "0"
          @order_address = Order.new(address: current_user.address,postal_code: current_user.postal_code,name: current_user.first_name + current_user.last_name)
      elsif @address_option == "1"
          @order_address = Order.new(order_params)
      end
  end
  def count 
      
  end
  private
  def order_params
      params.require(:order).permit(:cart_item_id,:postal_code,:address,:name,:payment_method,:status,:total_payment)
    end
    def order_create_params
      params.require(:order).permit(:postal_code,:address,:name,:payment_method,:total_payment,:buyer_id)
    end
end
