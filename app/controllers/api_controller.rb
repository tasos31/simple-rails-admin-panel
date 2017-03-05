class ApiController < ApplicationController
before_action :set_locale
	#Get all the Articles as a JSON response
	def articles_init
		@articles = Article.all.order(created_at: :desc)
		render json: @articles
	end

	#Get all the Events as a JSON response
	def events_init
		@events = Events.all.order(datetime: :desc)
		render json: @events
	end

	#Get all the Products as a JSON response
	def products_init
		@products = Product.all.order(position: :asc)
		render json: @products
	end

	private
	#Before responding with each JSON, we want to set the locale based on the locale we accept as a parameter
	#This project supports English, German and Greek locales. (Randomly picked 3 languages)
	#If none of the supported languages is given as a parameter, default to English.
	def set_locale
		if ['en', 'de','el'].include?(params[:locale])
			I18n.locale = params[:locale]
		else
			I18n.locale = 'en'
		end
	end

end
