class Article < ApplicationRecord
	#validations
	validates :image_url, presence: true
	validates :code, presence: true, uniqueness: true
	validates :description, presence: true

	#relations
	belongs_to :user
	has_many :movements
end
