class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update]
	before_action :require_admin, except: [:index, :show]

	def index
		@categories = Category.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
	end

	def show
		@articles = @category.articles.paginate(:page => params[:page], :per_page => 5)
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

        if @category.save
            flash[:notice] = "Category was created successfully."
            redirect_to category_path(@category)
        else 
            render 'new'
        end
	end

	def edit
	end

	def update
		if @category.update(category_params)
            flash[:notice] = "Category updated successfully."
            redirect_to @category
        else
            render 'edit'
        end
	end


	private

	def set_category
        @category = Category.find(params[:id])
    end

	def category_params
        params.require(:category).permit(:name)
    end

    def require_admin
    	if !(logged_in? && current_user.admin?)
    		flash[:alert] = "Only Admins can add categories"
    		redirect_to categories_path
    	end
    end

end