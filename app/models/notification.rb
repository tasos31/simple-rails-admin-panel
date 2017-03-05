class Notification < ApplicationRecord
	translates :title, :text
	globalize_accessors :locales => [:en, :de, :el], :attributes => [:title, :text]
end
