class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]     # DRY code
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @articles = Article.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    end

    def show
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)      # DRY code
        @article.user = current_user
        # render plain: @article.inspect
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to article_path(@article)
        else 
            render 'new'
        end
    end

    def edit
    end

    def update
        # render plain: @article.inspect
        if @article.update(article_params)      # DRY code
            flash[:notice] = "Article updated successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        # render plain: @article.inspect
        redirect_to @article
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, category_ids: [])
    end

    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:alert] = "You can edit or delete your own article"
            redirect_to @article
        end
    end

end