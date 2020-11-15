class Public::OrderDetailsController < ApplicationController
  before_action :set_search
  def index

  end
  def edit
    @order = Order.find(params[:id])
    @user = User.find(@order.user_id)
    # @order_details = OrderDetail.where(order_id:@order.id)
end

# PUT /public/order_details/:id
def update
  @order_detail = OrderDetail.find(params[:id])
  # byebug
   if @order_detail.shipping_status == "received"
     @order_detail.update(order_detail_params)
     redirect_to public_order_path(@order_detail.order.id)
   elsif @order_detail.update(order_detail_params)
    @order = @order_detail.order
    @order.order_details.where(photo_id: current_user.photo_ids).update_all(shipping_status: :received) if @order.order_details.where(photo_id: current_user.photo_ids).all?(&:shipped?)
    redirect_to sold_detail_public_order_path(@order.id)
  # elsif @order_detail.shipping_status == "recieved"
        # @order_detail.update(order_detail_params)
  else
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.where(photo_id:current_user.photos.pluck(:id))
    @order_payment = "クレジット"
    redirect_to sold_detail_public_order_path(@order.id)
  end
end

private
def order_detail_params
    params.require(:order_detail).permit(:shipping_status)
end
end

