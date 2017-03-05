class Product < ApplicationRecord
	translates :title, :text
	globalize_accessors :locales => [:en, :de, :el], :attributes => [:title, :text]
	mount_uploader :image, ImageUploader
	#acts_as_sortable
end
