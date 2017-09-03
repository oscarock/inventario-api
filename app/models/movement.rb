class Movement < ApplicationRecord
	#validations
	validates :movement_type_id, presence: true
	validates :article_id, presence: true
	validates :amount, presence: true
	validates :user_id, presence: true

	#relations
  	belongs_to :movement_type, optional: true
  	belongs_to :article, optional: true
  	belongs_to :user, optional: true

  	def self.type_total(type, article)
    	where(movement_type_id: type, article_id: article).sum(:amount)
  	end

  	def self.total(article)
    	type_total(1, article) - type_total(2, article)
  	end
end
