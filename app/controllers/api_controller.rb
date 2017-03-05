class ApiController < ApplicationController

	def init
		if ['en', 'de','el'].include?(params[:locale])
			I18n.locale = params[:locale]
		else
			I18n.locale = 'en'
		end

		@articles = Article.all.order(created_at: :desc)
		@events = Event.all.order(datetime: :desc)
		@products = Product.all.order(position: :asc)
		@services = Service.all.order(position: :asc)
		@wines = Wine.all.order(position: :asc)


		@article_hash=[]

		@articles.each_with_index do |article, counter|
			@article_hash[counter]={}
			@article_hash[counter][:id] = article.id
			@article_hash[counter][:image] = article.image
			@article_hash[counter][:updated_at] = article.updated_at.strftime("%d/%m/%Y")
			@article_hash[counter][:title] = article.title
			@article_hash[counter][:text] = article.text
		end

		@event_hash=[]

		@events.each_with_index do |event, counter|
			@event_hash[counter]={}
			@event_hash[counter][:id] = event.id
			@event_hash[counter][:image] = event.image
			@event_hash[counter][:timestamp] = event.datetime.to_i
			@event_hash[counter][:datetime] = event.datetime.strftime("%d/%m/%Y %H:%M")
			@event_hash[counter][:title] = event.title
			@event_hash[counter][:text] = event.text
		end

		@admin = Admin.first
		@profile_hash = {}
		@profile_hash[:image]= @admin.image
		@profile_hash[:title]= @admin.title
		@profile_hash[:text]= @admin.text
		@profile_hash[:address]= @admin.address
		@profile_hash[:telephone]= @admin.telephone
		@profile_hash[:email]= @admin.email

		data_json = {articles: @article_hash, events: @event_hash, products: @products,
			services: @services, wines: @wines, profile: @profile_hash}

		render json: data_json
	end

end
