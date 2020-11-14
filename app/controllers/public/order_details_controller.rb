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

  if @order_detail.update(order_detail_params)
    @order = @order_detail.order
    @order.order_details.where(photo_id: current_user.photo_ids).update_all(shipping_status: :received) if @order.order_details.where(photo_id: current_user.photo_ids).all?(&:shipped?)

    #order_details.each do |detail|
    #  detail.present?
    #end

    #order_details.each(&:present?)
     
    redirect_to sold_detail_public_order_path(@order.id)
  else

  end

#   # @order_details = @order_detail.order.order_details
#   @order_details = OrderDetail.where(order_id: @order_detail.order_id)

#   @order = @order_detail.order
#   @order_detail.update(shipping_status: order_detail_params[:shipping_status].to_i)
  




#     if params[:order_detail][:shippig_status] == "1"
#       @both_order = 0
#       @order_details.each do |order_detail|
#         order_detail.shipping_status_before_type_cast == 1
#         @both_order += 1
#         @both_order == @order_details.count
#         order_detail.update(shipping_status: 2)
#         @shipping_status = "受け取り評価待ち"
#       end
#       redirect_to sold_detail_public_order_path(@order)
#       # public_order(@order)
#     else
#       render "public/orders/sold_detail"
#       # render sold_detail_public_order_path(@order)
#       #  render sold_detail_public_order_path(@order)
#     end
end

private
def order_detail_params
    params.require(:order_detail).permit(:shipping_status)
end
end

