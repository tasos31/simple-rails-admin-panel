class Admin < ApplicationRecord
	has_secure_password
	translates :title, :text
	globalize_accessors :locales => [:en, :de, :el], :attributes => [:title, :text]
	mount_uploader :image, ImageUploader
end
