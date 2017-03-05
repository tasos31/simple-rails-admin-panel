class AdminController < ApplicationController

#This project is old and supposed to only have only one admin user, so I don't use Devise.
#I might update it with Devise later.

	before_action :set_admin, only: [:edit, :update]

	def login
	  if params[:admin][:username].present? && params[:admin][:password].present?
	    found_user = Admin.where(:username => params[:admin][:username]).first
	      if found_user
	        authorized_user = found_user.authenticate(params[:admin][:password])
	        session[:admin]=params[:admin][:username]
	      end
	  end
	  if authorized_user
	  	render :js => "window.location = '#{index_path}'"
	  else
	    respond_to do |format|
				format.js {render :action => 'wrong_credentials'}
		end
	  end
	end

	def destroy #LOGOUT FUNCTION
	  session[:admin] = nil
	  redirect_to :controller => 'home', :action => 'login'
	end

	def load_partial
		@admin = Admin.first
		#add_breadcrumb "Home", :root_path
	end

	def edit
		@admin = Admin.first

	end

	def update
		@article = Article.first
		@empty_field_flag = false

		params[:admin].values.each do |param|
		  if !param.present?
		  	@empty_field_flag = true
		  end
		end

		if !@empty_field_flag
			if @admin.update(admin_params)
				@admin = Admin.first #needed to load admin partial again
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

	private
	def set_admin
		@admin = Admin.first
	end


	def admin_params
		if params[:admin][:image].present?
			params.require(:admin).permit(:id, :image, :address, :email, :telephone, *Admin.globalize_attribute_names)
		else
			params.require(:admin).permit(:id, :address, :email, :telephone, *Admin.globalize_attribute_names)
		end
	end
end
