class CartController < ApplicationController
    def index
        @carts=Cart.all
    end


    def update
        @cart = Cart.find(params[:id])
        @oldstock=@cart.pro_stock
        @product=Product.find(@cart.product_id)
        if @cart.update(stock_params)

            if @oldstock < @cart.pro_stock 
                @newstock=@cart.pro_stock-@oldstock
                @product.stock= @product.stock-@newstock
                @product.save
                @cart.save
            else
                @newstock=@oldstock-@cart.pro_stock
                @product.stock= @product.stock+@newstock
                @product.save
                @cart.save
            end
            redirect_to cart_index_path
        end

    end


    def create
        @user=User.find(current_user.id)
        @cart= @user.carts.create(cart_params)
        if @cart.save
            @cart.subtotal=(@cart.pro_stock).to_i*(@cart.pro_price).to_i
            @product=Product.find(@cart.product_id)
            @product.stock= @product.stock-@cart.pro_stock
            @product.save
            @cart.save
            redirect_to customer_index_path
        end

    end

    def destroy
        @cart = Cart.find(params[:id])
        @product=Product.find(@cart.product_id)
        if @cart.destroy
            @product.stock= @product.stock+@cart.pro_stock
            @product.save
        redirect_to cart_index_path
      end
    end

    private
    def cart_params
      params.require(:product).permit(:pro_name, :pro_price, :pro_stock, :product_id, :sell_id)
    end

    private
    def stock_params
      params.require(:cart).permit(:pro_stock)
    end
end
