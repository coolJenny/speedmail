class Keywordgroup < ApplicationRecord
	belongs_to :user
	has_many :keywords
	has_many :recipients
end
