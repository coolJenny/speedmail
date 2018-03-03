class Recipient < ApplicationRecord
	belongs_to :keywordgroup
	belongs_to :user
end
