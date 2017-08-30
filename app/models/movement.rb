class Movement < ApplicationRecord
	#validations
	validates :movement_type, presence: true
	validates :amount, presence: true
	validates :articles_id, presence: true

  belongs_to :articles
end
