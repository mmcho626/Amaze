class ItemTime < ApplicationRecord

	has_many :items, dependent: :destroy

end
