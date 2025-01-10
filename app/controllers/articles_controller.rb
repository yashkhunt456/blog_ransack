class ArticlesController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]


  def index
    #@articles = Article.order(created_at: :asc) .page(params[:page]) #.without_count

    #ransack
    @q = Article.ransack(params[:q])
    @articles = @q.result.page(params[:page])


    # use for paginate_array
    #@articles = Article.all 
    #@paginatable_array = Kaminari.paginate_array(@articles).page(params[:page]).per(2)

    # changes in views
    # <div>
    #   <% @paginatable_array.each do |article| %>
    #     <div>
    #       <%= link_to article.title, article %>
    #     </div>
    #   <% end %>
    # </div><br>
    # <%= paginate @paginatable_array, window: 1 %>
    # <%= page_entries_info @paginatable_array %>

  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
      #NotificationMailer.notify(@article).deliver_now
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  

  private
  def article_params
    params.expect(article: [ :title, :content ])
  end

end
