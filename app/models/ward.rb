class Ward < ApplicationRecord
	def to_param
	  ward_number
	end
end
