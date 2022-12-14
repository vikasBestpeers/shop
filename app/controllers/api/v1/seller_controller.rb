class Api::V1::SellerController < Api::V1::ApiController
  # skip_before_action :verify_authenticity_token


  def index
    @current_user=User.last
    @products = @current_user.products
    # render :index
    
  end
  
  def create
    @current_user=User.last
    @user=current_user 
    @product=@user.products.new(product_params)
    # byebug
    if @product.save
      redirect_to  api_v1_seller_index_path 
    
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to  api_v1_seller_index_path 
    end
  end
  
  
  
  def destroy
    # byebug
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to  api_v1_seller_index_path 
    

  end



  private
    def product_params
      params.permit(:name, :stock, :price)
    end
end