class EventsController < ApplicationController
	before_action :set_event, only: [:edit, :update, :destroy]

	def load_partial
		@events = Event.all.order(datetime: :desc)
		#add_breadcrumb "Home", :root_path
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@empty_field_flag = false
		#@event.datetime = params[:event][:datetime].to_i
		params[:event].values.each do |param|		
		  if !param.present?
		  	@empty_field_flag = true
		  end
		end

		if !@empty_field_flag
			if @event.save(event_params)		
				@events = Event.all #needed to load event partial again
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

		params[:event].values.each do |param|		
		  if !param.present?
		  	@empty_field_flag = true
		  end
		end

		if !@empty_field_flag
			if @event.update(event_params)		
				@events = Event.all #needed to load event partial again
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
		@event.remove_image!
		if @event.destroy
			respond_to do |format|
				format.js
			end
		end
	end

	###############PRIVATE##################
	private

	def set_event
		@event = Event.find(params[:id])
		@events = Event.all.order(:created_at)
	end

	def event_params
		if params[:event][:image].present?
			params.require(:event).permit(:id, :image, :datetime, *Event.globalize_attribute_names)
		else
			params.require(:event).permit(:id, :datetime, *Event.globalize_attribute_names)
		end
	end
	
end
