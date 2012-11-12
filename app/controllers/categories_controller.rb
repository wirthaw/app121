class CategoriesController < ApplicationController
	def index
    @categories = Category.all		
	end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to category_path(@category)
      flash[:notice] = "Category saved successfully"
    else
      render(:new)
      flash[:notice] = "Could not save Category"
    end
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:student])
      redirect_to category_path
      flash[:notice] = "Category successfully updated"
    else
      render(:edit)
      flash[:notice] = "Category could not be updated!"
    end
  end

  def destory
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to category_path
      flash[:notice] = "Category has been removed"
    else
      redirect_to category_path
      flash[:error] = "Category could not be removed" 
    end
  end
end
