class HomeController < ApplicationController
	def load_partial
		#@article = Article.all.order(:created_at)
		add_breadcrumb "Home", :root_path
	end

	def index
		add_breadcrumb "Home", :root_path
	end
end
