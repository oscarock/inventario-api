class Article < ApplicationRecord
	#validations
	validates :code, presence: true, uniqueness: true
	validates :description, presence: true

  belongs_to :user
end
