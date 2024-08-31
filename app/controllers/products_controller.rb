class ProductsController < ApplicationController

 
  before_action :authenticate_user!
  
 
  def index
    @products = Product.all
    
    @q = Product.ransack(params[:q])
    @products = @q.result
    @products = @products.paginate(page: params[:page], per_page: 6)
  end

  def show
    @product = Product.find(params[:id])
    @comment = @product.comments.build
    authorize! :read, @product
  end

  def new
    if current_user.admin?
      @product = Product.new
    else
      redirect_to products_path, alert: 'Only admins can create new posts.'
    end
  end

  def create
    if current_user.admin?
      @product = Product.new(product_params)

      if @product.save
        logger.info("Создан новый товар: #{product_params}")

        redirect_to @product
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to products_path, alert: 'Only admins can create new posts.'
    end
  end


  def edit
    if current_user.admin?
      @product = Product.find(params[:id])
    else
      redirect_to products_path, alert: 'Only admins can create new posts.'
    end
  end

  def update
    if current_user.admin?
      @product = Product.find(params[:id])
      
      if @product.update(product_params)
        redirect_to @product
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to products_path, alert: 'Only admins can create new posts.'
    end
  end

  def destroy
    if current_user.admin?
      @product = Product.find(params[:id])
      @product.destroy

      redirect_to root_path, status: :see_other
    else
      redirect_to products_path, alert: 'Only admins can create new posts.'
    end
   
  end

  private
    def product_params
      params.require(:product).permit(:title, :body, :price, :quantity, :img_url, category_ids: [])
    end
end
