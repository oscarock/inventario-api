class Movement < ApplicationRecord
	#validations
	validates :movement_type_id, presence: true
	validates :amount, presence: true
	validates :article_id, presence: true

	#relations
  	belongs_to :articles, optional: true
  	belongs_to :movement_type, optional: true
end
