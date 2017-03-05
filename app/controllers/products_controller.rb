class ProductsController < ApplicationController
	before_action :set_product, only: [:edit, :update, :destroy]
	before_action :update_version, only: [:move, :create, :update, :delete_image]

	def load_partial
		@products = Product.all.order(position: :asc)
		#add_breadcrumb "Home", :root_path
	end

	def move
    	@product = Product.find(params[:id])
    	@product.move_to! params[:position]
  	end

  	def sort
	    params[:order].each do |key,value|
	      Product.find(value[:id]).update_attribute(:position,value[:position])
	    end
	    
	    render :nothing => true
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		@admin = Admin.first
		@admin.increment(:products_last_position)
		@admin.save

		@empty_field_flag = false

		params[:product].values.each do |param|		
		  if !param.present?
		  	@empty_field_flag = true
		  end
		end

		if !@empty_field_flag
			if @product.save(product_params)		
				@products = Product.all.order(position: :asc) #needed to load product partial again
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

		params[:product].values.each do |param|		
		  if !param.present?
		  	@empty_field_flag = true
		  end
		end

		if !@empty_field_flag
			if @product.update(product_params)		
				@products = Product.all.order(position: :asc) #needed to load product partial again
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
		@product.remove_image!
		if @product.destroy
			respond_to do |format|
				format.js
			end
		end
	end

	def update_version
		@admin = Admin.first
		@admin.increment(:version_number, by = 1)
		@admin.save 	
	end

	###############PRIVATE##################
	private

	def set_product
		@product = Product.find(params[:id])
		@products = Product.all.order(position: :asc)
	end

	def product_params
		if params[:product][:image].present?
			params.require(:product).permit(:id, :position, :image, *Product.globalize_attribute_names)
		else
			params.require(:product).permit(:id, :position, *Product.globalize_attribute_names)
		end
	end
	
end
