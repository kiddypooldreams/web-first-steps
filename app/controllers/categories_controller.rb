class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end
  
    def new
      @category = Category.new
    end
    
    def show
        @category = Category.find(params[:id])
      end
  
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to categories_path, notice: 'Категория создана успешно'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @category = Category.find(params[:id])
    end
  
    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to categories_path, notice: 'Категория обновлена успешно'
      else
        render :edit
      end
    end
  
    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to categories_path, notice: 'Категория удалена успешно'
    end

    def products
        @category = Category.find(params[:category_id])
        @products = @category.products
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name)
    end
  end
  