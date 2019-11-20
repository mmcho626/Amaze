class Item < ApplicationRecord

	has_many :posts

	belongs_to :item_category
	belongs_to :item_person
	belongs_to :item_time

end
