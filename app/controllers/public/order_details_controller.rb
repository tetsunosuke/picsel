class Public::OrderDetailsController < ApplicationController
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
    if @order_detail.update(making_status: order_detail_params[:making_status].to_i)
          if params[:order_detail][:making_status] == "2"
                @order.status = 2
                @order.save
          elsif params[:order_detail][:making_status] == "3"
            @both_order = 0
            @order_details.each do |order_detail|
              if order_detail.making_status_before_type_cast == 3
                  @both_order += 1
              end
            end
            if @both_order == @order_details.count
              @order.update(status: 3)
            end
          end
          redirect_to edit_admins_order_detail_path(@order_detail.order_id)
    else
          render 'edit'
    end
end
private
def order_detail_params
    params.require(:order_detail).permit(:making_status)
end
end

end
