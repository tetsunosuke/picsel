class Public::OrderDetailsController < ApplicationController
  before_action :set_search
  def index

  end
  def edit
    @order = Order.find(params[:id])
    @user = User.find(@order.user_id)
    # @order_details = OrderDetail.where(order_id:@order.id)
end
def update
  @order_detail = OrderDetail.find(params[:id])
  # @order_details = @order_detail.order.order_details
  @order_details = OrderDetail.where(order_id: @order_detail.order_id)
    @order = @order_detail.order
    if @order_detail.update(shipping_status: order_detail_params[:shipping_status].to_i)
          if params[:order_detail][:shipping_status] == "2"
                @order.status = 2
                @order.save
          elsif params[:order_detail][:shippig_status] == "3"
            @both_order = 0
            @order_details.each do |order_detail|
              if order_detail.shipping_status_before_type_cast == 3
                  @both_order += 1
              end
            end
            if @both_order == @order_details.count
              @order.update(status: 3)
            end
          # elsif params[:order_detail][:shipping_status] == "4"
          end
          redirect_to  sold_detail_public_order_path(@order)
        else
          render 'edit'
    end
  end

private
def order_detail_params
    params.require(:order_detail).permit(:shipping_status)
end
end

