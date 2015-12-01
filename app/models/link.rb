class Link < ActiveRecord::Base
	belongs_to :user
	has_many :skills
	has_one :industry
	has_one :company
	
extend FriendlyId
friendly_id :title, use: :slugged
#self.per_page = 30
end
