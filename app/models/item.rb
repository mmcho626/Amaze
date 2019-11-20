class Item < ApplicationRecord

	has_many :posts

	belongs_to :item_category, optional: true #nilを許可
	belongs_to :item_person, optional: true #nilを許可
	belongs_to :item_time, optional: true #nilを許可

end
