class Public::CartItemsController < ApplicationController
    def index
        @cart_items = current_user.cart_items
    end

    def create

         @cart_item = current_user.cart_items.find_by(photo_id: params[:cart_item][:photo_id])
         # @cart_item = current_user.cart_items.new(cart_item_params)
        if @cart_item.presence
          @cart_item.amount += params[:cart_item][:amount].to_i
          @cart_item.update(amount:@cart_item.amount)
          @cart_item.save
          redirect_to public_cart_items_path
  
        elsif   @cart_item_new = CartItem.new(cart_item_params)
                @cart_item_new.user_id = current_user.id
                @cart_item_new.save
                @cart_items = CartItem.all
                redirect_to public_cart_items_path
        else
          @photo = Photo.find(params[:id])
          render 'public/photos/show'
        end
    end
  
    def update
      @cart_item = CartItem.find(params[:id])
      if @cart_item.update(cart_item_params)
        redirect_to public_cart_items_path(@cart_item.id)
      else
        render 'edit'
      end
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
       redirect_to public_cart_items_path
    end
   
       def delete_all
         @cart_item_all = current_customer.cart_items
         @cart_item_all.destroy_all
         redirect_to root_path, notice: 'カートが空になりました。'
       end

    private 
    def cart_item_params
      params.require(:cart_item).permit(:amount,:photo_id,:user_id)
    end
end
