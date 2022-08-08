class OrderController < ApplicationController
    def index
        @orders=current_user.orders
    end

    def create
       @carts=current_user.carts
        @total=0
        @carts.each do |cart|
            @total=@total+cart.subtotal
        end
        @order=current_user.orders.new(total_price:@total)
        
        if @order.save
            @carts.each do |cart|
                @product_id=cart.product_id
                @stock=cart.pro_stock
                @subtotal=cart.subtotal
                @order_details=@order.order_details.new(product_id: @product_id, stock: @stock, subtotal: @subtotal)
                @order_details.save
            end
            @carts.destroy_all
            redirect_to  order_index_path 
            
        end
    end
    
    def show
        @order=Order.find(params[:id])
        @order_details=@order.order_details
    end
end
