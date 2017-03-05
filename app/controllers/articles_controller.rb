class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :destroy]

	def load_partial
		@articles = Article.all.order(created_at: :desc)
		#add_breadcrumb "Home", :root_path
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@empty_field_flag = false

		params[:article].values.each do |param|
		  if !param.present?
		  	@empty_field_flag = true
		  end
		end

		if !@empty_field_flag
			if @article.save(article_params)
				@articles = Article.all #needed to load article partial again
				respond_to do |format|
	   				format.js
				end
			end
		else
			respond_to do |format|
				format.js {render :action => 'required_fields'}
			end
		end
	end

	def edit

	end

	def update
		@empty_field_flag = false

		params[:article].values.each do |param|
		  if !param.present?
		  	@empty_field_flag = true
		  end
		end

		if !@empty_field_flag
			if @article.update(article_params)
				@articles = Article.all #needed to load article partial again
				respond_to do |format|
	   				format.js
				end
			end
		else
			respond_to do |format|
				format.js {render :action => 'required_fields'}
			end
		end
	end

	def destroy
		@article.remove_image!
		if @article.destroy
			respond_to do |format|
				format.js
			end
		end
	end

	###############PRIVATE##################
	private

	def set_article
		@article = Article.find(params[:id])
		@articles = Article.all.order(:created_at)
	end

	def article_params
		if params[:article][:image].present?
			params.require(:article).permit(:id, :image, *Article.globalize_attribute_names)
		else
			params.require(:article).permit(:id, *Article.globalize_attribute_names)
		end
	end

end
