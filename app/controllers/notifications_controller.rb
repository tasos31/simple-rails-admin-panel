class NotificationsController < ApplicationController
	before_action :set_notification, only: [:destroy]

	def load_partial
		@notifications = Notification.all.order(created_at: :desc)
		#add_breadcrumb "Home", :root_path
	end

	def new
		@notification = Notification.new
	end

	def create
		@notification = Notification.new(notification_params)
		@empty_field_flag = false

		params[:notification].values.each do |param|		
		  if !param.present?
		  	@empty_field_flag = true
		  end
		end

		if !@empty_field_flag
			params = {"app_id" => "#############################", 
			          "contents" => {"en" => @notification.text_en, "de" => @notification.text_de},
			          "included_segments" => ["All"]}
			uri = URI.parse('https://onesignal.com/api/v1/notifications')
			http = Net::HTTP.new(uri.host, uri.port)
			http.use_ssl = true

			request = Net::HTTP::Post.new(uri.path,
			                              'Content-Type'  => 'application/json;charset=utf-8',
			                              'Authorization' => "Basic #############################")
			request.body = params.as_json.to_json
			response = http.request(request) 
			puts response.body	

			if @notification.save(notification_params)		
				@notifications = Notification.all #needed to load notification partial again
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
		if @notification.destroy
			respond_to do |format|
				format.js
			end
		end
	end

	###############PRIVATE##################
	private

	def set_notification
		@notification = Notification.find(params[:id])
		@notifications = Notification.all.order(:created_at)
	end

	def notification_params	
		params.require(:notification).permit(:id, *Notification.globalize_attribute_names)
	end
	
end

